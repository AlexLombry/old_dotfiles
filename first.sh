#!/usr/bin/env bash
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

bot "Configuring MacOSX"

# Install XCode Developer tools
running "Install developer tools from XCode"
xcode-select --install
ok

running "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
ok

running "not showing hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false
ok

running "only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4
ok

running "Expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
ok

running "Show the ~/Library folder in Finder"
chflags nohidden ~/Library
ok

running "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
ok

running "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true
ok

running "Disable autohide for the Dock"
defaults write com.apple.dock autohide -bool false
ok

running "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true
ok

running "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
ok

running "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15
ok

running "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
ok

running "Enable Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
ok

running "Disable smart quotes as it's annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
ok

running "Disable natural Lion-style scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
ok

running "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
ok

running "Reveal IP address, hostname, OS version when clicking the clock in the login window"
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
ok

###############################################################################
# Screen                                                                      #
###############################################################################
running "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
ok

running "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"
ok

running "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true
ok
