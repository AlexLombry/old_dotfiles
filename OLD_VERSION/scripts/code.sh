#!/usr/bin/env bash
source ~/dotfiles/scripts/lib.sh

action "Create symlinks to get back your Sublime configuration from Dropbox"
echo cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
echo rm -rf User
echo ln -s ~/Dropbox/Sublime/User
ok

