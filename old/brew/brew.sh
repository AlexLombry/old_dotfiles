#!/bin/bash

# Installer OhMyZsh
echo "Install Oh-My-Zsh"
curl -L http://install.ohmyz.sh | sh

# Install brew
echo "Install HomeBrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brews
echo "Install Brew command line software"
brew tap homebrew/php
brew install $(cat Brewfile|grep -v "#")

echo "Install Vim & MacVim"
brew install macvim --override-system-vim --with-cscope --with-lua --HEAD
brew install vim --env-std --override-system-vim --with-lua
brew install reattach-to-user-namespace

# Install Cask
echo "Install Brew cask GUI software"
brew install caskroom/cask/brew-cask

# Install casks
brew cask install $(cat Caskfile|grep -v "#")

# Update brew
brew update

# Cleanup all installation file
brew cleanup
