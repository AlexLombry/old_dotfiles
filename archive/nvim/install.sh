#!/usr/bin/env bash
brew remove neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/general ~/.config/nvim/general
ln -s ~/dotfiles/nvim/keys ~/.config/nvim/keys
ln -s ~/dotfiles/nvim/plugins ~/.config/nvim/plugins
ln -s ~/dotfiles/nvim/themes ~/.config/nvim/themes

brew install luarocks luv
brew install --HEAD luajit
brew install --HEAD neovim



