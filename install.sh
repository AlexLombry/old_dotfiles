#!/usr/bin/env bash
source ./lib.sh

# Install Oh-My-Zsh
running "Install Oh-My-Zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    curl -L http://install.ohmyz.sh | sh
    chsh -s $(which zsh);
fi

###############################################################################
# Homebrew sweets                                                             #
###############################################################################
running "checking homebrew install"
ok

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

###############################################################################
#Install command-line tools using Homebrew                                    #
###############################################################################
# Make sure we are using the latest Homebrew
running "updating homebrew"
brew update
ok

action "upgrade brew packages..."
brew upgrade
ok "brews updated..."

bot "installing homebrew command-line tools"

# Install brews
running "Install Brew command line software"
brew tap homebrew/php > /dev/null 2>&1
brew tap homebrew/services > /dev/null 2>&1
brew tap homebrew/dupes > /dev/null 2>&1
brew tap homebrew/versions > /dev/null 2>&1
brew tap phrase/brewed > /dev/null 2>&1
brew tap caskroom/cask > /dev/null 2>&1
brew tap caskroom/fonts > /dev/null 2>&1

running "Install Brew and Cask file"
require_brew $(cat ./BrewFile|grep -v "#")
require_cask $(cat ./CaskFile|grep -v "#")

# Install shell extensions
/usr/local/opt/fzf/install

bot "installing fonts via homebrew casks..."

require_cask font-droid-sans-mono-for-powerline
require_cask font-inconsolata-for-powerline
require_cask font-source-code-pro-for-powerline

###############################################################################
# Native Apps (via brew cask)                                                 #
###############################################################################
bot "installing GUI tools via homebrew casks..."
brew tap caskroom/versions > /dev/null 2>&1

# virtal machines
require_cask virtualbox
# vagrant for running dev environments using docker images
require_cask vagrant # # | grep Caskroom | sed "s/.*'\(.*\)'.*/open \1\/Vagrant.pkg/g" | sh
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-scp

bot "Alright, cleaning up homebrew cache..."
# Remove outdated versions from the cellar
brew cleanup > /dev/null 2>&1
bot "All clean"

composer global require friendsofphp/php-cs-fixer
composer global require laravel/valet
composer global require m6web/coke
composer global require laravel/installer
composer global require laravel/lumen-installer

###############################################################################
# Vim Installation                                                            #
###############################################################################
running "Create vim swap and backup dir"
rm -rf ~/.vim
mkdir -p ~/.vim/{backups,swap,bundle,colors,autoload}
require_brew vim --env-std --override-system-vim --with-lua
curl https://raw.githubusercontent.com/farfanoide/vim-facebook/master/colors/facebook.vim -o ~/.vim/colors/facebook.vim
curl https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim -o ~/.vim/colors/atom-dark-256.vim
ok

running "Cloning Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ok

running "Launch Vim and configuring it"
vim +PluginInstall +qall
ok

###############################################################################
# For file in config_files                                                    #
###############################################################################
files=$( ls -1 -d config_files/* )
for file in $files ; do
    pwd="$(pwd)/"
    filename="$(ls $file | cut -d. -f1 | cut -d/ -f2)"
    ln -s $pwd$file ~/.$filename
done
