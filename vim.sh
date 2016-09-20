#!/bin/bash
source ./lib.sh

running "updating homebrew"
brew update
ok

require_brew macvim --override-system-vim --with-cscope --with-lua --HEAD
require_brew vim --env-std --override-system-vim --with-lua

running "Create vim swap and backup dir"
mkdir ~/.vim/backups
mkdir ~/.vim/swap
mkdir ~/.vim/bundle
mkdir ~/.vim/colors
mkdir ~/.vim/autoload
wget https://raw.githubusercontent.com/farfanoide/vim-facebook/master/colors/facebook.vim ~/.vim/colors/facebook.vim
wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim ~/.vim/colors/atom-dark-256.vim

running "Cloning Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

running "Launch Vim and configuring it"
vim +PluginInstall +qall

running "Copying Taybalt theme from Taylor"
cp ~/dotfiles/zsh/theme/taybalt.zsh-theme ~/.oh-my-zsh/themes/taybalt.zsh-theme