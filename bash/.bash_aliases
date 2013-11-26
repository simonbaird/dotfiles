# vi
alias vi=vim

# Eg `some_command | pipevim`
alias pipevim='vim -R -'

# Less (with ansi colours)
alias less='less -R'
alias more='less -R'

# Editing this file (note that it doesn't unalias anything)
alias edalias='vim -f ~/.bash_aliases ~/.bash_aliases_local +all; source ~/.bash_aliases; source ~/.bash_aliases_local'

# Fresh dotfiles
alias dotfiles_pull='cd ~/.dotfiles; git pull --ff-only'
