#!/bin/bash

DOTFILES=$HOME/dotfiles
BACKUP_TIME=$(date +%s)

echo "creating symlinks"

linkables=$( ls -1 -d **/*.lnk )

for file in $linkables ; do
    target="$HOME/.$( basename $file ".lnk" )"
    echo "Backup your old file"
    mv $target $target.backup.$BACKUP_TIME

    echo "Create link for $file"
    ln -s $DOTFILES/$file $target
done