#!/usr/bin/env bash
mkdir -p ~/.config/nvim

brew install luarocks luv
brew install neovim --HEAD

ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
