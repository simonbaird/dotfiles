#!/bin/bash

echo 'Sourcing ~/.bash_aliases'

alias la='ls -la'

#
# Handy macro to edit this file and reload it.
# Note that it doesn't unalias things because
# there are probably aliases defined elsewhere that
# we don't want to trash. This can lead to surprises
# so beware.
#
edalias() {
  vim -f ~/.bash_aliases # -f means in foreground
  source ~/.bash_aliases
}

#
# When starting gvim without a file want to run CommandT
# (There's probably a way to do this in .vimrc)
# (TODO: Slightly broken for files with spaces in their names)
#
vi() {
  if [ -n "$1" ]; then
    gvim $*
  else
    gvim -c 'CommandT'
  fi
}

term() {
  gnome-terminal --profile=$1
}

# Eg, some_command | pipevim
alias pipevim='vim -R -'

#
# Rails shortcuts
#
alias ss='./script/server'
alias sc='./script/console'

#alias ss='./script/server -d'
alias rs='kill -USR2 `cat tmp/pids/mongrel.pid`'

alias findgrep=~/bin/findgrep
#alias ack=findgrep

alias less='less -R'
alias more='less -R'

#alias cdiff='git diff | vim -R -'
#alias ccdiff='git diff --staged | vim -R -'
alias cdiff='git diff --color'
alias ccdiff='git diff --staged --color'

# Going to use this in my bash prompt
function show_git_branch {
  branch_name=`git branch 2> /dev/null | grep '^\*' | tail -c +3`
  [ -n "$branch_name" ] && echo "[$branch_name] "
}

#
# Mysql stuff
# (Should use rake tasks instead of these...)
#

# Dump a mysql database to a gzipped sql file
dbdump() {
  # (adjust defaults as required)
  GZ_FILE=$1; [ ! -n "$GZ_FILE" ] && GZ_FILE="$HOME/.dbdump.gz"
  DB_NAME=$2; [ ! -n "$DB_NAME" ] && DB_NAME='errata'
  echo -n "Dumping database $DB_NAME to $GZ_FILE..."
  # Add --extended-insert=FALSE to mysql command for more readable but MUCH slower sql
  mysqldump -u root $DB_NAME | gzip - > "$GZ_FILE"
  echo ' Done'
}

# Load a mysql database from a gzipped sql file
dbload() {
  # (adjust defaults as required)
  GZ_FILE=$1; [ ! -n "$GZ_FILE" ] && GZ_FILE="$HOME/.dbdump.gz"
  DB_NAME=$2; [ ! -n "$DB_NAME" ] && DB_NAME='errata'
  echo -n "Loading database $DB_NAME from $GZ_FILE..."
  echo "DROP DATABASE $DB_NAME; CREATE DATABASE $DB_NAME;" | mysql -u root
  zcat $GZ_FILE | mysql -u root -D $DB_NAME
  echo ' Done'
}

#
# https://gist.github.com/663503
#
# Use this to clean your repo by removing old branches.
# It will remove the branch on local and on origin.
#
# Usage:
#   $ nuke_branch some_old_branch_you_dont_need
#
# Note we use -d not -D for teh safety.
#
nuke_branch() {
  # Loop over all given branches
  for branch in $*; do
    # Check for remote branch
    CHECK_REMOTE_EXISTS=`git branch -r | grep -e "^..origin/$branch\$"`
    if [ -n "$CHECK_REMOTE_EXISTS" ]; then
      echo "** Nuking remote branch origin/$branch"
      # Delete the remote branch
      git branch -d -r origin/$branch
      # Push to remove it from origin (or something..?)
      git push origin :$branch
    else
      echo "** Remote branch origin/$branch not found"
    fi

    # Check for local branch
    CHECK_LOCAL_EXISTS=`git branch | grep -e "^..$branch\$"`
    if [ -n "$CHECK_LOCAL_EXISTS" ]; then
      echo "** Nuking local branch $branch"
      # Delete the local branch
      git branch -d $branch
    else
      echo "** Local branch $branch not found"
    fi
    echo ""
  done
}
