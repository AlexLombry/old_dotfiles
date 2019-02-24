#!/usr/bin/env bash
source ~/dotfiles/scripts/lib.sh

export HOMEBREW_NO_AUTO_UPDATE=1

running "XCode Command Line Tools"
if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null
    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
        sleep 5
    done
    xcode-select -p &> /dev/null
    if [ $? -eq 0 ]; then
        # Prompt user to agree to the terms of the Xcode license
        # https://github.com/alrra/dotfiles/issues/10
       sudo xcodebuild -license
   fi
fi

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
HOMEBREW_NO_AUTO_UPDATE=1 brew bundle
ok

running "Install shell extensions"
HOMEBREW_NO_AUTO_UPDATE=1 brew install fzf
/usr/local/opt/fzf/install
ok

# running "Install Powerline shell"
# mkdir -p ~/Code/
# git clone https://github.com/b-ryan/powerline-shell
# cd powerline-shell
# sudo python setup.py install
# mkdir -p ~/.config/powerline-shell && powerline-shell --generate-config > ~/.config/powerline-shell/config.json
# ok

running "Install Zsh Plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ok

###############################################################################
# For file in config                                                          #
###############################################################################
running "Install configuration file symlink"
files=$( ls -1 -d config/* )
for file in $files ; do
    pwd="$(pwd)/"
    filename="$(ls $file | cut -d. -f1 | cut -d/ -f2)"
    ln -s $pwd$file ~/.$filename
done
ok