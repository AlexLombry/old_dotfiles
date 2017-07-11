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

running "Copying Taybalt theme from Taylor"
cp ~/dotfiles/zsh/theme/taybalt.zsh-theme ~/.oh-my-zsh/themes/taybalt.zsh-theme
ok

echo $0 | grep zsh > /dev/null 2>&1 | true
if [[ ${PIPESTATUS[0]} != 0 ]]; then
    running "changing your login shell to zsh"
    chsh -s $(which zsh);ok
else
    bot "looks like you are already using zsh. woot!"
fi

# Launch MacOS Script
./macos.sh

# create all symlinks
symlinkifne .ackrc
symlinkifne .crontab
symlinkifne .ctags
symlinkifne .gitconfig
symlinkifne .gitignore_global
symlinkifne .htoprc
symlinkifne .vim
symlinkifne .vimrc
symlinkifne .zshrc

require_vagrant_plugin vagrant-scp

popd > /dev/null 2>&1

bot "Woot! All done."
