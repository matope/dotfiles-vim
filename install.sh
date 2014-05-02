#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

DOTFILES_ROOT=`cd $(dirname $0); pwd`

cd $DOTFILES_ROOT
git submodule init
git submodule foreach 'git pull origin master'
git submodule update

ln -siv $DOTFILES_ROOT/.vimrc $HOME/.vimrc
ln -siv $DOTFILES_ROOT/.vimrc.powerline $HOME/.vimrc.powerline
ln -siv $DOTFILES_ROOT/.vim $HOME/.vim

success "Link done. executing vim +\":BundleInstall\"..."
vim +":BundleInstall" +:q +:q

exit 0
