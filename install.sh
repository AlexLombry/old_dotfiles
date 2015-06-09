#!/bin/bash
echo "Installing dotfiles"

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo "Install OSX"
    bash install/01-osx.sh

    echo "Zsh Script"
    bash install/02-zsh.sh

    echo "Brew Script"
    bash install 03-brew.sh

    echo "Vim Script"
    bash install 04-vim.sh

    echo "Link Script"
    bash install 05-link.sh
fi