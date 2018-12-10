#!/usr/bin/env bash
source ./lib.sh

###############################################################################
# For file in config_files                                                    #
###############################################################################
running "Install configuration file symlink"
files=$( ls -1 -d config_files/* )
for file in $files ; do
    pwd="$(pwd)/"
    filename="$(ls $file | cut -d. -f1 | cut -d/ -f2)"
    ln -s $pwd$file ~/.$filename
done
ok