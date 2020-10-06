# vi
alias vi=vim

# Eg `some_command | pipevim`
alias pipevim='vim - "+f stdin" "+set ro bt=nowrite"'

# Less (with ansi colours)
alias less='less -R'
alias more='less -R'

# Editing this file (note that it doesn't unalias anything)
edalias() {
  vim -f ~/.dotfiles/bash/aliases.sh ~/.bash_aliases_local +all
  source ~/.dotfiles/bash/aliases.sh; source ~/.bash_aliases_local
}

# Fresh dotfiles
alias dotfiles_pull='cd ~/.dotfiles; git pull --ff-only'

alias kcurl='curl -s -u: --negotiate'
alias gg='git grep -n'

alias rake='bundle exec rake'
alias rails='bundle exec rails'

alias ipaddr='ip -4 -br addr | grep UP'

diffdiff() {
  diff <(git diff $1) <(git diff $2)
}

vimdiffdiff() {
  #vimdiff <(git diff $1) <(git diff $2)
  vimdiff <(git show $1) <(git show $2)
}

rr() {
  NO_FIXTURE_LOAD=1 SILENCE_DEPRECATIONS=1 bundle exec ruby -Ilib:test $*
}

case `uname` in
  Darwin*)
    ###--- Mac only

    # http://apple.stackexchange.com/questions/39608/running-gnu-screen-with-256-colors-on-os-x-lion
    alias screen='/usr/local/bin/screen'

    # Set CLICOLOR if you want Ansi Colors in iTerm2
    export CLICOLOR=1

    # Set colors to match iTerm2 Terminal Colors
    export TERM=xterm-256color

  ;;
  Linux)
    ###--- Linux only
    alias dnf='sudo dnf'
    alias docker='sudo -E docker'
    alias docker-compose='sudo -E docker-compose'



  ;;
esac

case `hostname` in
  *.redhat.com)
    ###--- Work only

    filepub() {
      scp "$1" file.bos.redhat.com:public_html
      echo "http://file.bos.redhat.com/~$USER/$(basename "$1")"
    }

    ginvite() {
      git invite `git log -n ${1:-1} | grep 'Change-Id:' | cut -d: -f2 | xargs echo`
    }

  ;;

esac
