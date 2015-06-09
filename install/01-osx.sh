#!/bin/bash

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
chflags hidden ~/Library

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool false

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "Disable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Disable smart quotes as it’s annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done