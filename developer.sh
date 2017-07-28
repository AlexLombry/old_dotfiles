#!/usr/bin/env bash
source ./lib.sh

bot "updating homebrew"
    /usr/local/bin/composer global require friendsofphp/php-cs-fixer
    /usr/local/bin/composer global require laravel/valet
    /usr/local/bin/composer global require m6web/coke
    /usr/local/bin/composer global require laravel/installer
    /usr/local/bin/composer global require laravel/lumen-installer
ok

bot "updating homebrew"
    brew update
ok

bot "Create vim swap and backup dir"
    rm -rf ~/.vim
    require_brew macvim --override-system-vim --with-cscope --with-lua --HEAD
    require_brew vim --env-std --override-system-vim --with-lua

    mkdir ~/.vim/backups
    mkdir ~/.vim/swap
    mkdir ~/.vim/bundle
    mkdir ~/.vim/colors
    mkdir ~/.vim/autoload
    curl https://raw.githubusercontent.com/farfanoide/vim-facebook/master/colors/facebook.vim -o ~/.vim/colors/facebook.vim
    curl https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim -o ~/.vim/colors/atom-dark-256.vim
ok

bot "Cloning Vundle for vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ok

bot "Launch Vim and configuring it"
    vim +PluginInstall +qall
ok
