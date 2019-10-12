#!/usr/bin/env bash
source ~/dotfiles/scripts/lib.sh

###############################################################################
# For file in config                                                    #
###############################################################################
running "Install configuration file symlink"

files=$( ls -1 -d config/* )
for file in $files ; do
    pwd="$(pwd)/"
    filename="$(ls $file | cut -d. -f1 | cut -d/ -f2)"
    mv ~/.$filename ~/.$filename.bkp1-`date +%Y-%m-%d.%H:%M:%S`
    ln -s $pwd$file ~/.$filename
done
ok
