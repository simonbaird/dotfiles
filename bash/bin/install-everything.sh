#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALLER_DIR="$SCRIPT_DIR/../installers"

for script in "$INSTALLER_DIR"/install-*.sh; do
  echo "==> Running $(basename "$script")..."
  bash "$script"
done
