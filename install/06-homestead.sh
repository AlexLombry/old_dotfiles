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

echo "Global require of homestead"
composer global require "laravel/homestead=~2.0"

echo "Add composer bin path into your zshrc file"
echo "~/.composer/vendor/bin:$PATH" >> ~/.zshrc

echo "Source your zshrc file and init homestead"
source ~/.zshrc
~/.composer/vendor/bin/homestead init

echo "You have to update you .homestead/Homestead.yaml file and then do a homestead up"
