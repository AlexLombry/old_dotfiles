#!/usr/bin/env bash
source ./lib.sh

# Ask for the administrator password upfront
bot "I need you to enter your sudo password so I can install some things:"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

bot "OK, let's roll..."

running "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
ok

running "not showing hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false
ok

running "Disable smart quotes and dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
ok

running "Correct spelling automatically"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
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

# ==============================================
# Finder
# ==============================================
echo "Setting Finder preferences"

running "Expand the Open with and Sharing & Permissions panes"
defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true Privileges -bool true
ok

running "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true
ok

running "New window points to home"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
ok

running "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true
ok

running "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
ok

running "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
ok

running "Finder: allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true
ok

running "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
ok

running "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
ok

running "Use column view"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
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

running "No animation for hiding dock"
defaults write com.apple.dock autohide-time-modifier -int 0
ok

running "Show full file path"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
ok

running "Show expanded state for printing"
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
ok

bot "Please run command defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText \"LOCK MESSAGE\""
ok

# ==============================================
# Kill affected applications
# ==============================================

function killallApps() {
    killall "Finder" > /dev/null 2>&1
    killall "SystemUIServer" > /dev/null 2>&1
    killall "Dock" > /dev/null 2>&1

    appsToKill=(
    "Activity Monitor"
    "BBEdit"
    "Calendar"
    "Contacts"
    "Dashboard"
    "Disk Utility"
    "Safari"
    "System Preferences"
    "TextWrangler"
    "Xcode"
    )

    for app in "${appsToKill[@]}"
    do
        killall "${app}" > /dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            # We just killed an app so restart it
            open -a "${app}"
        fi
    done

    bot "Note that some of these changes require a logout/restart to take effect."
}

printf "Restart the affected applications? (y/n): "
read killallReply
if [[ $killallReply =~ ^[Yy]$ ]]; then
    killallApps
fi

exit 0
