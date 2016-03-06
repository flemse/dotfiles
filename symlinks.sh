#!/bin/bash

dir=~/.dotfiles
olddir=$dir/tmp
verbose=false
launchagentsPath=$dir/launchagents
vundleGit=https://github.com/VundleVim/Vundle.vim.git
vundlePath=~/.vim/bundle/Vundle.vim

mkdir -p $olddir

if ! git clone $vundleGit $vundlePath > /dev/null 2>&1
then
  $verbose && echo "vundle already installed. Moving on"
fi

for file in $(ls $launchagentsPath)
do
  if ! ln -s $launchagentsPath/$file ~/Library/LaunchAgents/$file > /dev/null 2>&1
  then
    $verbose && echo "$file already symlinked"
  else
    launchctl load ~/Library/LaunchAgents/$file
  fi
done

for file in $(ls $dir/scripts)
do
  mv -f ~/.$file $olddir  > /dev/null 2>&1
  if ! ln -s $dir/scripts/$file ~/.$file > /dev/null 2>&1; then
    $verbose && echo "$file already symlinked"
  fi
done

for vimfile in $(ls $dir/vimfiles); do
  if ! ln -s $dir/vimfiles/$vimfile ~/.vim/.$vimfile > /dev/null 2>&1; then
    $verbose && echo "$vimfile already symlinked"
  fi
done
echo "Done!"
