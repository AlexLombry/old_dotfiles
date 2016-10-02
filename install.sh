#!/usr/bin/env bash
source ./lib.sh

# make a backup directory for overwritten dotfiles
if [[ ! -e ~/dotfiles_backup ]]; then
    running "Backup your current files"
    mkdir ~/dotfiles_backup
    ok
fi

# Install Oh-My-Zsh
running "Install Oh-My-Zsh"
curl -L http://install.ohmyz.sh | sh
ok 

echo $0 | grep zsh > /dev/null 2>&1 | true
if [[ ${PIPESTATUS[0]} != 0 ]]; then
    running "changing your login shell to zsh"
    chsh -s $(which zsh);ok
else
    bot "looks like you are already using zsh. woot!"
fi

symlinkifne .ackrc
symlinkifne .crontab
symlinkifne .ctags
symlinkifne .gitconfig
symlinkifne .gitignore_global
symlinkifne .htoprc
symlinkifne .vim
symlinkifne .vimrc
symlinkifne .zshrc

popd > /dev/null 2>&1

# create all symlinks
./osx.sh

bot "Woot! All done."
