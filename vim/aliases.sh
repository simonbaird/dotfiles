alias vim_get_bundles='vim +BundleInstall +qall'
alias vim_update_bundles='vim +BundleInstall! +qall'
alias vim_install='git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim_update_bundles'
alias vim_clean_install='rm -rf ~/.vim && vim_install'
