#!/usr/bin/env bash
set -euo pipefail

dry_run=0
positional=()
for arg in "$@"; do
  case "$arg" in
    --dry-run) dry_run=1 ;;
    *) positional+=("$arg") ;;
  esac
done

if (( ${#positional[@]} < 1 || ${#positional[@]} > 2 )) || [[ -z "${positional[0]:-}" ]]; then
  printf 'Usage: %s [--dry-run] RELATIVE_PATH [HOSTNAME_OR_MATCHER]\n' "${0##*/}" >&2
  exit 2
fi

rsync_args=(-au)
if (( dry_run )); then
  # --mkpath lets rsync preview missing destination parents without creating them.
  rsync_args+=(-n -i --mkpath)
fi

# A single '.' means the current directory, mapped relative to $HOME.
relative_path=${positional[0]}
if [[ "$relative_path" == . ]]; then
  home_dir=$(cd -- "$HOME" && pwd -P)
  current_dir=$(pwd -P)
  case "$current_dir" in
    "$home_dir") printf 'Error: cannot use . from your home directory; choose a path within it.\n' >&2
                 exit 2 ;;
    "$home_dir"/*) relative_path=${current_dir#"$home_dir"/} ;;
    *) printf 'Error: current directory is not under your home directory: %s\n' "$current_dir" >&2
       exit 2 ;;
  esac
fi

# Keep both paths under their respective roots.
case "$relative_path" in
  /*|*/|*//*|..|./*|../*|*/./*|*/.|*/../*|*/..)
    printf 'Error: expected a path relative to your home directory (without . or .. components).\n' >&2
    exit 2
    ;;
esac

backup_host=$(hostname)
if (( ${#positional[@]} == 2 )); then
  backup_host=${positional[1]}
fi
case "$backup_host" in
  ''|.|..|*/*)
    printf 'Error: hostname matcher must be nonempty and contain no slashes.\n' >&2
    exit 2
    ;;
esac

backup_root="/var/run/media/$(id -un)/backup"
backup_dir="$backup_root/$backup_host"
# An exact directory name takes precedence; otherwise require one substring match.
if (( ${#positional[@]} == 2 )) && [[ ! -d "$backup_dir" ]]; then
  matches=()
  for candidate in "$backup_root"/*; do
    [[ -d "$candidate" ]] || continue
    name=${candidate##*/}
    [[ "$name" == *"$backup_host"* ]] && matches+=("$name")
  done
  case ${#matches[@]} in
    0) printf 'Error: no backup hostname matches: %s\n' "$backup_host" >&2; exit 1 ;;
    1) backup_dir="$backup_root/${matches[0]}" ;;
    *) printf 'Error: hostname matcher "%s" is ambiguous; matches:\n' "$backup_host" >&2
       printf '  %s\n' "${matches[@]}" >&2
       exit 2 ;;
  esac
fi
if [[ ! -d "$backup_dir" ]]; then
  printf 'Error: backup directory does not exist: %s\n' "$backup_dir" >&2
  exit 1
fi

source_path="$backup_dir${relative_path:+/$relative_path}"
dest_path="$HOME${relative_path:+/$relative_path}"

if [[ ! -e "$source_path" && ! -L "$source_path" ]]; then
  printf 'Error: backup path does not exist: %s\n' "$source_path" >&2
  exit 1
fi

# rsync --update skips newer destinations, but can still replace files with
# *equal* timestamps and different sizes. Select only missing or older entries
# so equal timestamps are left untouched too. No files are deleted.
if [[ -d "$source_path" && ! -L "$source_path" ]]; then
  if [[ -L "$dest_path" || ( -e "$dest_path" && ! -d "$dest_path" ) ]]; then
    printf 'Error: destination is not a directory: %s\n' "$dest_path" >&2
    exit 1
  fi
  if (( ! dry_run )); then
    mkdir -p -- "$dest_path"
  fi
  # --files-from does not recurse into listed directories without -r. Include
  # directories explicitly so empty ones are copied as well.
  find "$source_path" -mindepth 1 -print0 |
    while IFS= read -r -d '' entry; do
      relative_entry=${entry#"$source_path"/}
      target="$dest_path/$relative_entry"
      if [[ ( -d "$entry" && ! -L "$entry" ) ||
            ( ! -e "$target" && ! -L "$target" ) || "$entry" -nt "$target" ]]; then
        printf '%s\0' "$relative_entry"
      fi
    done |
    rsync "${rsync_args[@]}" --from0 --files-from=- -- "$source_path/" "$dest_path/"
else
  if [[ -d "$dest_path" ]]; then
    printf 'Error: destination is a directory: %s\n' "$dest_path" >&2
    exit 1
  fi
  if [[ ! -e "$dest_path" && ! -L "$dest_path" || "$source_path" -nt "$dest_path" ]]; then
    if (( ! dry_run )); then
      mkdir -p -- "$(dirname -- "$dest_path")"
    fi
    rsync "${rsync_args[@]}" -- "$source_path" "$dest_path"
  fi
fi
