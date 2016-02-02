#!/bin/bash

# Update brew
echo "Updating brew"
brew update

# install virtualbox and vagrant from cask
echo "Install virtualbox and vagrant if not exist"

# Set your personnal computer name
read -p "Installation de Virtualbox et Vagrant (y/n) " RESP
if [ "$RESP" = "y" ]; then
	brew cask install virtualbox vagrant    
else
    echo "Skip this step"
fi

echo "Install vagrant box homestead"
vagrant box add laravel/homestead

echo "Global require of homestead"
composer global require "laravel/homestead=~2.0"

echo "Add composer bin path into your zshrc file"
echo "~/.composer/vendor/bin:$PATH" >> ~/.zshrc