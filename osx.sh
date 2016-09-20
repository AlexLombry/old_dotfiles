#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

# Ask for the administrator password upfront
bot "I need you to enter your sudo password so I can install some things:"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

bot "OK, let's roll..."

#####
# install homebrew
#####

echo "Configuring MacOSX"

# Install XCode Developer tools
echo "Install developer tools from XCode"
xcode-select --install

# Set your personnal computer name
read -p "Do you want to set the ComputerName (y/n) " RESP
if [ "$RESP" = "y" ]; then
    read -p "What name do you want ?" PERSONAME
    if [ -n "$PERSONAME" ]; then
        sudo scutil --set ComputerName "$PERSONAME"
        sudo scutil --set HostName "$PERSONAME"
        sudo scutil --set LocalHostName "$PERSONAME"
    fi
else
    echo "Skip this step"
fi

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "not showing hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false

echo "only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "Expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Disable autohide for the Dock"
defaults write com.apple.dock autohide -bool false

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

#echo "Disable tap to click (Trackpad)"
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Disable smart quotes as it’s annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

echo "Disable natural Lion-style scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

running "Disable local Time Machine snapshots"
sudo tmutil disablelocal;ok

running "Disable hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0;ok

running "Remove the sleep image file to save disk space"
sudo rm -rf /Private/var/vm/sleepimage;ok

running "Create a zero-byte file instead"
sudo touch /Private/var/vm/sleepimage;ok

running "…and make sure it can’t be rewritten"
sudo chflags uchg /Private/var/vm/sleepimage;ok


###############################################################################
# Homebrew sweets                                                             #
###############################################################################
running "checking homebrew install"
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

running "checking brew-cask install"
output=$(brew tap | grep cask)
if [[ $? != 0 ]]; then
    action "installing brew-cask"
    require_brew caskroom/cask/brew-cask
fi
ok

###############################################################################
#Install command-line tools using Homebrew                                    #
###############################################################################
# Make sure we’re using the latest Homebrew
running "updating homebrew"
brew update
ok

bot "before installing brew packages, we can upgrade any outdated packages."
read -r -p "run brew upgrade? [y|N] " response
if [[ $response =~ ^(y|yes|Y) ]];then
    # Upgrade any already-installed formulae
    action "upgrade brew packages..."
    brew upgrade
    ok "brews updated..."
else
    ok "skipped brew package upgrades.";
fi

bot "installing homebrew command-line tools"

# Install brews
echo "Install Brew command line software"
brew tap homebrew/php > /dev/null 2>&1
brew tap homebrew/services > /dev/null 2>&1
brew tap homebrew/dupes > /dev/null 2>&1
brew tap homebrew/versions > /dev/null 2>&1
require_brew $(cat $HOME/dotfiles/install/BrewFile|grep -v "#")

# Install casks
require_cask $(cat $HOME/dotfiles/install/CaskFile|grep -v "#")

bot "installing fonts via homebrew casks..."
brew tap caskroom/fonts > /dev/null 2>&1

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

bot "Alright, cleaning up homebrew cache..."
# Remove outdated versions from the cellar
brew cleanup > /dev/null 2>&1
bot "All clean"