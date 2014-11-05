#!/bin/bash

dir=~/.dotfiles
olddir=$dir/tmp
files="gemrc gitconfig gvimrc powconfig ruby-version vimrc xrayconfig zshrc"
verbose=false

mkdir -p $olddir

if ! git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &> /dev/null; then
  $verbose && echo "vundle already installed. Moving on"
fi

for file in $files; do
  mv -f ~/.$file $olddir &> /dev/null
  if ! ln -s $dir/$file ~/.$file &> /dev/null; then
    $verbose && echo "$file already symlinked"
  fi
done

for vimfile in $(ls $dir/vimfiles); do
  if ! ln -s $dir/vimfiles/$vimfile ~/.vim/.$file &> /dev/null; then
    $verbose && echo "$file already symlinked"
  fi
done
echo "Done!"
