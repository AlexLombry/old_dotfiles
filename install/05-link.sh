#!/bin/bash

DOTFILES=$HOME/dotfiles
BACKUP_TIME=$(date +%s)

echo "Creating symlinks"

linkables=$( ls -1 -d **/*.lnk )

for file in $linkables ; do
    target="$HOME/.$( basename $file ".lnk" )"

    echo "Backup your old file"
    mv $target backup.$target.$BACKUP_TIME

    echo "Create link for $file"
    ln -s $DOTFILES/$file $target
done