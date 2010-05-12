#!/bin/bash

alias vi=mvim

edalias() {
	vim ~/.bash_aliases
	source ~/.bash_aliases
}

alias findgrep=~/bin/findgrep
alias ack=findgrep

alias less='less -R'
alias more='less -R'

#alias cdiff='git diff | vim -R -'
#alias ccdiff='git diff --staged | vim -R -'
alias cdiff='git diff --color'
alias ccdiff='git diff --staged --color'
