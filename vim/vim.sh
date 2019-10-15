#!/usr/bin/env bash
source ~/dotfiles/macos/lib.sh

###############################################################################
# Vim Installation                                                            #
###############################################################################
running "Create vim swap and backup dir"
rm -rf ~/.vim
mv ~/.vimrc ~/.vimrc.`date +%Y-%m-%d.%H:%M:%S`
mkdir -p ~/.vim/{backups,swap,bundle,colors,autoload}
ok

pwd="$(pwd)"

ln -s $pwd/vim/vimrc ~/.vimrc
ln -s $pwd/vim/plugins.vim ~/.vim/plugins.vim
ln -s $pwd/vim/ideavimrc ~/.ideavimrc

running "Add new colorscheme"
cp -R ~/dotfiles/vim/colors ~/.vim/
ok

brew install vim --with-override-system-vi --with-lua
ok

running "Cloning Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ok

running "Launch Vim and configuring it"
vim +PluginInstall +qall
ok
