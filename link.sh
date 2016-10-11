#!/bin/sh

# link
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.xvimrc ~/.xvimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Install NeoBundle
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  echo 'clone'
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi