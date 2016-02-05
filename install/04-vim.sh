#!/bin/bash
echo "Install all dependancies for Vim"

brew update

brew install macvim --override-system-vim --with-cscope --with-lua --HEAD
brew install vim --env-std --override-system-vim --with-lua
brew install tmux
brew install reattach-to-user-namespace

echo "Delete just in case old .vim/* folders"
rm -rf ~/.vim/*

echo "Create vim swap and backup dir"
mkdir ~/.vim/backups
mkdir ~/.vim/swap
mkdir ~/.vim/colors
mkdir ~/.vim/autoload
curl -o ~/.vim/colors/facebook.vim https://raw.githubusercontent.com/farfanoide/vim-facebook/master/colors/facebook.vim

echo "Cloning Vundle for vim"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Launch Vim and configuring it"
vim +PluginInstall +qall

echo "Copying Taybalt theme from Taylor"
cp ~/dotfiles/zsh/theme/taybalt.zsh-theme ~/.oh-my-zsh/themes/taybalt.zsh-theme