#!/usr/bin/env bash
source ./lib.sh

###############################################################################
# Vim Installation                                                            #
###############################################################################
running "Create vim swap and backup dir"
rm -rf ~/.vim
mkdir -p ~/.vim/{backups,swap,bundle,colors,autoload}
ok

running "Add new colorscheme"
cp -R ~/dotfiles/config_files/vim/colors ~/.vim/
ok 

brew install vim --env-std --override-system-vim --with-lua
ok

running "Cloning Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ok

running "Launch Vim and configuring it"
vim +PluginInstall +qall
ok