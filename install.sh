#!/bin/bash

echo "Installing dotfiles"

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo "install software for mac"
    source install/software.sh

    echo "install brew and all things"
    source install/brew.sh

    echo "generate all symlinks"
    source install/link.sh

    echo "updating macosx configuration"
    source install/osx.sh

    echo "Cloning Vundle for vim"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Set the Magic Wallpaper"
sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = 'img/wallpaper.png'"
killall Dock

echo "configuring zsh as default shell"
chsh -s $(which zsh)
