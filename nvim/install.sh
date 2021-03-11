#!/usr/bin/env bash
mkdir -p ~/.config/nvim

brew install luarocks luv
brew install neovim --HEAD

npm i -g neovim
pip install --upgrade pip
pip3 install --upgrade pip3
pip install pynvim
pip3 install pynvim
sudo gem install neovim

ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
