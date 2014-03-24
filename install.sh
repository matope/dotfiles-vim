#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

ask_and_link() {
  ln -siv $1 $2
#  /bin/echo -n "Make link $1 -> $2 ? [y/n]"
#  read ANS
#  if [ "$ANS" = 'y' -o "$ANS" = 'yes' ]; then
#    ln -fs $1 $2
#    success "Linked $1 -> $2"
#  fi
}

DOTFILES_ROOT=`cd $(dirname $0); pwd`

cd $DOTFILES_ROOT
git submodule init
git submodule foreach 'git pull origin master'
git submodule update

ask_and_link $DOTFILES_ROOT/.vimrc $HOME/.vimrc
ask_and_link $DOTFILES_ROOT/.vimrc.powerline $HOME/.vimrc.powerline
ask_and_link $DOTFILES_ROOT/.vim $HOME/.vim

success "Link done. executing vim +\":BundleInstall\"..."
vim +":BundleInstall" +:q +:q

exit 0
