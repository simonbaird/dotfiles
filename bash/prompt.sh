
_ansi_code() {
  echo '\[\033['$1'm\]'
}

_Black=$(        _ansi_code '0;30')
_Red=$(          _ansi_code '0;31')
_Green=$(        _ansi_code '0;32')
_Orange=$(       _ansi_code '0;33')
_Blue=$(         _ansi_code '0;34')
_Purple=$(       _ansi_code '0;35')
_Cyan=$(         _ansi_code '0;36')
_LightGray=$(    _ansi_code '0;37')
_DarkGray=$(     _ansi_code '1;30')
_LightRed=$(     _ansi_code '1;31')
_LightGreen=$(   _ansi_code '1;32')
_Yellow=$(       _ansi_code '1;33')
_LightBlue=$(    _ansi_code '1;34')
_LightPurple=$(  _ansi_code '1;35')
_LightCyan=$(    _ansi_code '1;36')
_White=$(        _ansi_code '1;37')
_ClearColor=$(   _ansi_code '0'   )

_show_git_branch() {
  GIT_REPO=`git rev-parse --show-toplevel 2>/dev/null`
  GIT_BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  #[ ! -z $GIT_REPO ] && echo "[`basename $GIT_REPO`:$GIT_BRANCH] "
  [ ! -z $GIT_REPO ] && echo "[$GIT_BRANCH] "
}

PS1="$_Cyan\h:$_Yellow\w> $_LightBlue\$(_show_git_branch)$_ClearColor"
