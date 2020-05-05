DOTFILES=$HOME/.dotfiles

source $DOTFILES/bash/prompt.sh
source $DOTFILES/bash/rvm.sh

for dir in vim git tmux bash; do
  [[ -s $DOTFILES/$dir/aliases.sh ]] && source $DOTFILES/$dir/aliases.sh
done

[[ -s ~/.bash_aliases_local ]] && source ~/.bash_aliases_local

DISABLE_AUTO_TITLE=true
