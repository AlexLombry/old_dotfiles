#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

bot "Do you wish to change your shell back to bash?"
read -r -p "[Y|n] " response

if [[ $response =~ ^(no|n|N) ]];then
    bot "ok, leaving shell as zsh..."
else
    bot "ok, changing shell to bash..."
    chsh -s $(which bash);ok
fi

bot "Restoring dotfiles from backup..."

pushd ~ > /dev/null 2>&1

function updatedotfile {
    if [[ -e ~/$1 ]]; then
        unlink $1;
        echo -en "project dotfiles $1 removed";ok
    fi

    if [[ -e ~/dotfiles_backup/$1 ]]; then
        mv ~/dotfiles_backup/$1 ./
        echo -en "$1 backup restored";ok
    fi
}

updatedotfile .ackrc
updatedotfile .crontab
updatedotfile .ctags
updatedotfile .gitconfig
updatedotfile .gitignore_global
updatedotfile .htoprc
updatedotfile .vim
updatedotfile .vimrc
updatedotfile .zshrc

popd > /dev/null 2>&1

bot "Woot! All done."
