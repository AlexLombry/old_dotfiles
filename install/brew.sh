#!/bin/bash

# Install XCode Developer tools
echo "Install developer tools from XCode"
xcode-select --install

# Installer OhMyZsh
echo "Install Oh-My-Zsh"
curl -L http://install.ohmyz.sh | sh

# Install brew.
echo "Install HomeBrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# cli tools
echo "Install Command line tools"
brew install ack
brew install tree
brew install wget
brew install youtube-dl
brew install ngrep
brew install htop

echo "Install Developer tools"
# development tools
brew install tmux
brew install ccat
brew install Cmake
brew install nvm

# Install Powerline for vim
# Powerline already configured on my .vimrc file
echo "Install and configure Python, needed for Awesome Vim"
brew install python
brew install coreutils
brew install macvim --override-system-vim --with-cscope --with-lua --HEAD
brew install vim --env-std --override-system-vim --with-lua
brew install reattach-to-user-namespace

echo "Configure Powerline for Vim and iTerm2"
pip install git+git://github.com/powerline/powerline
git clone git://github.com/powerline/fonts.git ~/powerlinefonts
bash ~/powerlinefonts/install.sh
rm -rf ~/powerlinefonts

echo "installing node (from nvm)"
nvm install stable
nvm alias default stable

echo "Installation finished"
