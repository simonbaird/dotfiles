_YELLOW='\[\033[01;33m\]'
_GREEN='\[\033[01;32m\]'
_BLUE='\[\033[01;34m\]'
_MAGENTA='\[\033[01;35m\]'
_CYAN='\[\033[01;36m\]'
_NOCOLOR='\[\033[00m\]'

_show_git_branch() {
  GIT_REPO=`git rev-parse --show-toplevel 2>/dev/null`
  GIT_BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  #[ ! -z $GIT_REPO ] && echo "[`basename $GIT_REPO`:$GIT_BRANCH] "
  [ ! -z $GIT_REPO ] && echo "[$GIT_BRANCH] "
}

PS1="$_MAGENTA\h:$_GREEN\w> $_YELLOW\$(_show_git_branch)$_NOCOLOR"
