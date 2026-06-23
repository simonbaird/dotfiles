export HISTCONTROL=ignoredups

DOTFILES=$HOME/.dotfiles

source $DOTFILES/bash/path.sh
source $DOTFILES/bash/prompt.sh
source $DOTFILES/bash/rvm.sh

for dir in vim git tmux bash; do
  [[ -s $DOTFILES/$dir/aliases.sh ]] && source $DOTFILES/$dir/aliases.sh
done

[[ -s ~/.bash_aliases_local ]] && source ~/.bash_aliases_local

DISABLE_AUTO_TITLE=true

# When you enter a pass phrase for your GPG key when signing a commit using git
# use a text based prompt rather than a gui dialog.
#export GPG_TTY=$(tty)
export PINENTRY_BINARY=/usr/bin/pinentry-curses

# https://asdf-vm.com/guide/getting-started.html
#source "$HOME/.asdf/asdf.sh"
#source "$HOME/.asdf/completions/asdf.bash"

# Needed for entering passphrase when signing a commit
export GPG_TTY=$(tty)
