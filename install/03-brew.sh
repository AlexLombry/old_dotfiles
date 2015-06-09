#!/bin/bash

cd $HOME/dotfiles/install
# Install brew
echo "Install HomeBrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brews
echo "Install Brew command line software"
brew tap homebrew/php
brew install $(cat $HOME/dotfiles/install/BrewFile|grep -v "#")

# Install Cask
echo "Install Brew cask GUI software"
brew install caskroom/cask/brew-cask

# Install casks
brew cask install $(cat $HOME/dotfiles/install/CaskFile|grep -v "#")

# Update brew
echo "Updating brew"
brew update

# Cleanup all installation file
echo "Cleaning brew"
brew cleanup

cd $HOME/dotfiles