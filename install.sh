#!/bin/bash

echo "Installing dotfiles"

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo "install software for mac"
    source install/software.sh

    echo "install brew and all things"
    source install/brew.sh

    echo "updating macosx configuration"
    source install/osx.sh

    echo "generate all symlinks"
    source install/link.sh
fi

echo "configuring zsh as default shell"
chsh -s $(which zsh)