#!/usr/bin/env bash
if [ "$(uname)" != "Darwin" ]; then
  echo "Sorry, this script can only be launched on macOS"
  exit
fi

echo "Forcing reinstall PHP"
# PHPVER=$(php --version | tail -r | tail -n 1 | cut -d " " -f 2 | cut -c 1,3)
read -p "Do you want to update PHP at latest version ? ?(y|N)" response
if [ "$response" = "y" ]; then
  echo ">>>> Update Homebrew"
  brew update

  echo ">>>> Stop and delete all PHP Version"
  brew list | grep php | while read x; do brew services stop $x; done
  brew list | grep php | while read x; do brew uninstall --force $x; done

  echo ">>>> Delete Cellar PHP, LaunchAgents and LaunchDaemons"
  sudo rm -rf /usr/local/Cellar/php
  sudo rm ~/Library/LaunchAgents/homebrew.mxcl.php*
  sudo rm /Library/LaunchDaemons/homebrew.mxcl.php*

  echo ">>>> Delete old brew tap for PHP"
  brew untap homebrew/php
  brew cleanup
  brew doctor

  echo ">>>> Install PHP and XDebug"
  brew install php
  pecl install xdebug

  echo ">>>> Install composer"
  brew install composer

  echo ">>>> Start PHP Services"
  brew services start php

  echo "Install Symfony binary tool"
  curl -sS https://get.symfony.com/cli/installer | bash
  mv "$HOME"/.symfony/bin/symfony /usr/local/bin/symfony

  echo "Please delete old PHP from your PATH on your ~/.zshrc file if you had one"
fi
