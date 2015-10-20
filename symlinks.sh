#!/bin/bash

dir=~/.dotfiles
olddir=$dir/tmp
verbose=true

mkdir -p $olddir

if ! git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &> /dev/null; then
  $verbose && echo "vundle already installed. Moving on"
fi

for file in $(ls $dir/scripts)
do
  mv -f ~/.$file $olddir &> /dev/null
  if ! ln -s $dir/scripts/$file ~/.$file &> /dev/null; then
    $verbose && echo "$file already symlinked"
  fi
done

for vimfile in $(ls $dir/vimfiles); do
  if ! ln -s $dir/vimfiles/$vimfile ~/.vim/.$vimfile &> /dev/null; then
    $verbose && echo "$vimfile already symlinked"
  fi
done
echo "Done!"
