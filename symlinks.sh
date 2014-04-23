#!/bin/bash

dir=~/.dotfiles
olddir=$dir/tmp
files="gemrc gitconfig gvimrc powconfig ruby-version vimrc xrayconfig zshrc"

mkdir -p $olddir

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

for file in $files; do
  mv ~/.$file $olddir
  ln -s $dir/$file ~/.$file
done
