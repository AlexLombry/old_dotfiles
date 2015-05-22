#!/bin/bash

DOTFILES=$HOME/dotfiles

echo "creating symlinks"
linkables=$( ls -1 -d **/*.lnk )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".lnk" )"
    echo "Create link for $file"
    ln -s $DOTFILES/$file $target
done