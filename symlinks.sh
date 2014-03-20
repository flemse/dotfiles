#!/bin/bash

dir=~/.dotfiles
olddir=$dir/tmp
files="gemrc gitconfig gvimrc powconfig ruby-version vimrc xrayconfig zshrc"

mkdir -p $olddir


for file in $files; do
  mv ~/.$file $olddir
  ln -s $dir/$file ~/.$file
done
