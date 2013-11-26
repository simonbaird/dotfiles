#!/bin/bash

dotfile_link() {
  SUBDIR=$1
  FILE=$2
  TARGET=.dotfiles/$SUBDIR/$FILE
  TS=`date +%Y%m%d%H%M%S`

  cd $HOME
  if [ -L $FILE ]; then
    echo Leaving $FILE symlink alone
  else
    if [ -e $FILE ]; then
      echo Preserving existing $FILE as $FILE.$TS
      mv $FILE $FILE.$TS
    fi
    echo "Creating symlink $FILE -> $TARGET"
    ln -s $TARGET
  fi
}

dotfile_link bash   .bash_profile
dotfile_link bash   .bashrc
dotfile_link bash   .bash_aliases
dotfile_link screen .screenrc
dotfile_link vim    .vimrc
dotfile_link git    .gitconfig
dotfile_link git    .gitignore-global
