# vi
alias vi=vim

# Eg `some_command | pipevim`
alias pipevim='vim -R -'

# Less (with ansi colours)
alias less='less -R'
alias more='less -R'

# Editing this file (note that it doesn't unalias anything)
alias edalias='vim -f ~/.dotfiles/bash/aliases.sh ~/.bash_aliases_local +all; source ~/.dotfiles/bash/aliases.sh; source ~/.bash_aliases_local'

# Fresh dotfiles
alias dotfiles_pull='cd ~/.dotfiles; git pull --ff-only'

alias kcurl='curl -s -u: --negotiate'
alias gg='git grep -n'

rr() {
  NO_FIXTURE_LOAD=1 SILENCE_DEPRECATIONS=1 ruby -Ilib:test $*
}

case `uname` in
  Darwin*)
    ### Mac only

    # http://apple.stackexchange.com/questions/39608/running-gnu-screen-with-256-colors-on-os-x-lion
    alias screen='/usr/local/bin/screen'

  ;;
  Linux)
    ### Linux only



  ;;
esac
