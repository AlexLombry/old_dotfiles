#!/usr/bin/env bash
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/general ~/.config/nvim/general
ln -s ~/dotfiles/nvim/keys ~/.config/nvim/keys
ln -s ~/dotfiles/nvim/plugins ~/.config/nvim/plugins
ln -s ~/dotfiles/nvim/themes ~/.config/nvim/themes

brew install luarocks luv
brew install neovim --HEAD

npm i -g neovim
pip install --upgrade pip
pip3 install --upgrade pip3
pip install pynvim
pip3 install pynvim
sudo gem install neovim



