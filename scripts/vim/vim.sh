#!/usr/bin/env bash
source ~/dotfiles/scripts/zsh/functions.zsh

brew install vim

running "Create vim swap and backup dir"
rm -rf ~/.vim
mv ~/.vimrc ~/.vimrc.`date +%Y-%m-%d.%H:%M:%S`.autobackup
mv ~/.ideavimrc ~/.ideavimrc.`date +%Y-%m-%d.%H:%M:%S`.autobackup
mkdir -p ~/.vim/{backups,swap,bundle,colors,autoload}

pwd="$(pwd)"

ln -s $pwd/scripts/vim/vimrc ~/.vimrc
ln -s $pwd/scripts/vim/plugins.vim ~/.vim/plugins.vim
ln -s $pwd/scripts/vim/ideavimrc ~/.ideavimrc

running "Add new colorscheme"
cp -R ~/dotfiles/scripts/vim/colors ~/.vim/

running "Cloning Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

running "Launch Vim and configuring it"
vim +PluginInstall +qall
