#!/usr/bin/env bash
source ./lib.sh

# Install Oh-My-Zsh
running "Install Oh-My-Zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    curl -L http://install.ohmyz.sh | sh
    chsh -s $(which zsh);
fi
ok

###############################################################################
# Homebrew sweets                                                             #
###############################################################################
running "checking homebrew install"
ok

brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    action "Install homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
        error "unable to install homebrew, script $0 abort!"
        exit -1
    fi
fi
ok

running "Install all brew dependencies"
brew bundle
ok

running "Install shell extensions"
brew install fzf
/usr/local/opt/fzf/install
ok

###############################################################################
# For file in config_files                                                    #
###############################################################################
running "Install configuration file symlink"
files=$( ls -1 -d config_files/* )
for file in $files ; do
    pwd="$(pwd)/"
    filename="$(ls $file | cut -d. -f1 | cut -d/ -f2)"
    ln -s $pwd$file ~/.$filename
done
ok

running "Install Powerline shell"
mkdir -p ~/Code/
git clone https://github.com/banga/powerline-shell
cd powerline-shell
sudo python setup.py install
ok