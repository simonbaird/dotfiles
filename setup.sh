#!/bin/bash

TS=`date +%Y%m%d%H%M%S`

dotfile_link() {
  FILE=$1
  SUBDIR=$2
  echo "$FILE -> .dotfiles/$SUBDIR/$FILE"
  [ -e $FILE ] && mv $FILE $FILE.$TS
  ln -s .dotfiles/$SUBDIR/$FILE
}

cd $HOME
dotfile_link .bash_profile bash
dotfile_link .bashrc bash
dotfile_link .gitconfig git
dotfile_link .screenrc screen
dotfile_link .vimrc vim
