# global definitions
[[ -s /etc/bashrc ]] && source /etc/bashrc

# For rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Git completion
[[ -s "$HOME/.git-completion.bash" ]] && source "$HOME/.git-completion.bash"

# Prompt
YELLOW='\[\033[01;33m\]'
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
MAGENTA='\[\033[01;35m\]'
CYAN='\[\033[01;36m\]'
NOCOLOR='\[\033[00m\]'

#PS1='\u:\w> '
PS1="$GREEN\w>$NOCOLOR "
PROMPT_COMMAND='printf "%*s\r" "$COLUMNS" "`show_git_branch` "'

# Aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[[ -s "$HOME/.bash_aliases_local" ]] && source "$HOME/.bash_aliases_local"

# fix vim in roxterm?
TERM=xterm-256color
