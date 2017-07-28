#!/usr/bin/env bash
source ./lib.sh

# Install XCode Developer tools
running "Install developer tools from XCode"
sudo xcode-select --install

# Install Oh-My-Zsh
running "Install Oh-My-Zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    curl -L http://install.ohmyz.sh | sh
    chsh -s $(which zsh);
fi

# Installing composer
running "Installing composer..."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

running "Installing Homebrew..."
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    action "installing homebrew"
    ruby -e "$(curl -fsSL /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")"
    if [[ $? != 0 ]]; then
        error "unable to install homebrew, script $0 abort!"
        exit -1
    fi
fi

running "checking brew-cask install"
output=$(brew tap | grep cask)
if [[ $? != 0 ]]; then
    action "installing brew-cask"
    require_brew caskroom/cask/brew-cask
fi

running "updating homebrew"
brew update