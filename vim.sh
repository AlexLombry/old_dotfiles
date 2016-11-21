#!/bin/bash
source ./lib.sh

running "updating homebrew"
brew update
ok

rm -rf ~/.vim
require_brew macvim --override-system-vim --with-cscope --with-lua --HEAD
require_brew vim --env-std --override-system-vim --with-lua

running "Create vim swap and backup dir"
mkdir ~/.vim/backups
mkdir ~/.vim/swap
mkdir ~/.vim/bundle
mkdir ~/.vim/colors
mkdir ~/.vim/autoload
curl https://raw.githubusercontent.com/farfanoide/vim-facebook/master/colors/facebook.vim -o ~/.vim/colors/facebook.vim
curl https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim -o ~/.vim/colors/atom-dark-256.vim
ok

running "Cloning Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ok

running "Launch Vim and configuring it"
vim +PluginInstall +qall
ok
