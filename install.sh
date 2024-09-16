#!/bin/bash

dotfile_link() {
  SUBDIR=$1
  FILE=$2
  DIR=$3
  TARGET=$HOME/.dotfiles/$SUBDIR/$FILE
  TS=`date +%Y%m%d%H%M%S`

  mkdir -p $HOME/$3
  cd $HOME/$3
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

dotfile_link bash main.sh .bashrc.d
dotfile_link bash bin
dotfile_link screen .screenrc
dotfile_link tmux .tmux.conf
dotfile_link vim .vimrc
dotfile_link git .gitconfig
dotfile_link git .gitignore-global
dotfile_link . nvim .config
