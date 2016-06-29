#!/bin/sh

DOTFILES_ROOT=`cd $(dirname $0); pwd`

cd $DOTFILES_ROOT

# Link files
ln -siv $DOTFILES_ROOT/.vimrc $HOME/.vimrc
ln -siv $DOTFILES_ROOT/.vim $HOME/.vim

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Link done. executing vim +\":PlugInstall\"..."
vim +":PlugInstall" +:q +:q

exit 0
