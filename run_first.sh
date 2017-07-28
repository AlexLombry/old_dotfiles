#!/usr/bin/env bash
source ./lib.sh

# Install XCode Developer tools
bot "Install developer tools from XCode"
    sudo xcode-select --install
ok

# Install Oh-My-Zsh
bot "Install Oh-My-Zsh"
    if [ ! -d ls ~/.oh-my-zsh ]; then
        curl -L http://install.ohmyz.sh | sh
        chsh -s $(which zsh);
    fi
ok

# Installing composer
bot "Installing composer..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    mv composer.phar /usr/local/bin/composer
ok

bot "Installing Homebrew..."
    brew_bin=$(which brew) 2>&1 > /dev/null
    if [[ $? != 0 ]]; then
        action "installing homebrew"
        ruby -e "$(curl -fsSL /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")"
        if [[ $? != 0 ]]; then
            error "unable to install homebrew, script $0 abort!"
            exit -1
        fi
    fi
ok

bot "checking brew-cask install"
    output=$(brew tap | grep cask)
    if [[ $? != 0 ]]; then
        action "installing brew-cask"
        require_brew caskroom/cask/brew-cask
    fi
ok