#!/bin/bash

echo "Installing dotfiles"

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    read -p "Do you want to install basic software (google chrome, etc) (y/n) " RESPA
    if [ "$RESPA" = "y" ]; then
        echo "install software for mac"
        source install/software.sh
    fi

    read -p "Do you want to update your MacOSX Configuration (y/n) " RESPD
    if [ "$RESPD" = "y" ]; then
        echo "updating macosx configuration"
        source install/osx.sh
    fi

    read -p "Do you want to install brew, composer, zsh ... RECOMMANDED (y/n) " RESPB
    if [ "$RESPB" = "y" ]; then
        echo "install brew and all things"
        source install/brew.sh

        echo "generate all symlinks"
        source install/link.sh

        echo "Cloning Vundle for vim"
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

        echo "configuring zsh as default shell"
        chsh -s $(which zsh)

        echo "Create backups and swap directory for .vim"
        mkdir -p ~/.vim/backups
        mkdir -p ~/.vim/swap

        echo "Launch Vim and configuring it"
        vim +PluginInstall +qall
    fi

fi