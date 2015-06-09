#!/bin/bash

# Installer OhMyZsh
echo "Install Oh-My-Zsh"
curl -L http://install.ohmyz.sh | sh

# Install brew
echo "Install HomeBrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brews
brew install $(cat Brewfile|grep -v "#")

# Install casks
brew cask install $(cat Caskfile|grep -v "#")

# Update brew
brew update

# Cleanup all installation file
brew cleanup