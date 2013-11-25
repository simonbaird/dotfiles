alias vim_update='vim +BundleInstall +qall'
alias vim_bootstrap='git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim_update'
alias vim_rebuild='rm -rf ~/.vim && vim_bootstrap'
