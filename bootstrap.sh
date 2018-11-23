#!/bin/sh
#
# Example usage:
#
#  curl -s https://raw.githubusercontent.com/simonbaird/dotfiles/master/bootstrap.sh
#  curl -s https://raw.githubusercontent.com/simonbaird/dotfiles/master/bootstrap.sh | bash
#
# (Assumes you already added an ssh key to github.)
#
git clone git@github.com:simonbaird/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
source ./install.sh
echo Now run vim_install to setup vim
exec bash
