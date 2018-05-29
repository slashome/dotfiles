#!/bin/bash

VIM_PATH=$HOME/.vim

if [ ! -d $VIM_PATH ]; then
	mkdir -p $VIM_PATH
fi

if [ ! -f $VIM_PATH/vimrc ]; then
	ln -s ./vim/vimrc $VIM_PATH/vimrc
fi

if [ ! -f $VIM_PATH/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi