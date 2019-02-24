<?php 

$commands = [
[ "comment" => "Finder: show all filename extensions",
"command" => "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"],

[ "comment" => "not showing hidden files by default",
"command" => "defaults write com.apple.Finder AppleShowAllFiles -bool false"],

[ "comment" => "Disable smart quotes and dashes",
"command" => "defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false"],

[ "comment" => "Disable smart quotes and dashes",
"command" => "defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false"],

[ "comment" => "Correct spelling automatically",
"command" => "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false"],

[ "comment" => "only use UTF-8 in Terminal.app",
"command" => "defaults write com.apple.terminal StringEncodings -array 4"],

[ "comment" => "Expand save dialog by default",
"command" => "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true"],

[ "comment" => "Show the ~/Library folder in Finder",
"command" => "chflags nohidden ~/Library"],

[ "comment" => "Use current directory as default search scope in Finder",
"command" => "defaults write com.apple.finder FXDefaultSearchScope -string \"SCcf\""],

[ "comment" => "Show Path bar in Finder",
"command" => "defaults write com.apple.finder ShowPathbar -bool true"],

[ "comment" => "Enable autohide for the Dock",
"command" => "defaults write com.apple.dock autohide -bool true"],

[ "comment" => "Show Status bar in Finder",
"command" => "defaults write com.apple.finder ShowStatusBar -bool true"],

[ "comment" => "Set a blazingly fast keyboard repeat rate",
"command" => "defaults write NSGlobalDomain KeyRepeat -int 2"],

[ "comment" => "Set a shorter Delay until key repeat",
"command" => "defaults write NSGlobalDomain InitialKeyRepeat -int 15"],

[ "comment" => "Enable tap to click (Trackpad)",
"command" => "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"],

[ "comment" => "Enable Safari's debug menu",
"command" => "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true"],

[ "comment" => "Disable smart quotes as it's annoying for messages that contain code",
"command" => "defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add \"automaticQuoteSubstitutionEnabled\" -bool false"],

[ "comment" => "Disable natural Lion-style scrolling",
"command" => "defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false"],

[ "comment" => "Speed up Dock switching",
"command" => "defaults write com.apple.dock autohide-delay -float 0"],

[ "comment" => "Speed up Dock switching",
"command" => "defaults write com.apple.dock autohide-time-modifier -float 0"],

["comment" => "Kill dock",
"command" => "killall Dock"],

[ "comment" => "Expand the Open with and Sharing & Permissions panes",
"command" => "defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true Privileges -bool true"],

[ "comment" => "Show status bar",
"command" => "defaults write com.apple.finder ShowStatusBar -bool true"],

[ "comment" => "New window points to home",
"command" => "defaults write com.apple.finder NewWindowTarget -string \"PfHm\""],

[ "comment" => "Finder: disable window animations and Get Info animations",
"command" => "defaults write com.apple.finder DisableAllAnimations -bool true"],

[ "comment" => "Show icons for hard drives, servers, and removable media on the desktop",
"command" => "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true"],


[ "comment" => "Show icons for hard drives, servers, and removable media on the desktop",
"command" => "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true"],

[ "comment" => "Show icons for hard drives, servers, and removable media on the desktop",
"command" => "defaults write com.apple.finder ShowMountedServersOnDesktop -bool true"],

[ "comment" => "Show icons for hard drives, servers, and removable media on the desktop",
"command" => "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true"],

[ "comment" => "Finder: show all filename extensions",
"command" => "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"],

[ "comment" => "Finder: allow text selection in Quick Look",
"command" => "defaults write com.apple.finder QLEnableTextSelection -bool true"],

[ "comment" => "When performing a search, search the current folder by default",
"command" => "defaults write com.apple.finder FXDefaultSearchScope -string \"SCcf\""],

[ "comment" => "Avoid creating .DS_Store files on network volumes",
"command" => "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"],

[ "comment" => "Use column view",
"command" => "defaults write com.apple.finder FXPreferredViewStyle -string \"clmv\""],

###############################################################################
# Screen                                                                      #
###############################################################################
[ "comment" => "Save screenshots to the desktop",
"command" => "defaults write com.apple.screencapture location -string \"~/Desktop\""],

[ "comment" => "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)",
"command" => "defaults write com.apple.screencapture type -string \"png\""],

[ "comment" => "Disable shadow in screenshots",
"command" => "defaults write com.apple.screencapture disable-shadow -bool true"],

[ "comment" => "Show full file path",
"command" => "defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES"],

[ "comment" => "Show expanded state for printing",
"command" => "defaults write -g PMPrintingExpandedStateForPrint -bool TRUE"],

[ "comment" => "Set Locking Message",
"command" => "Please run comment defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText \"LOCK MESSAGE\""]
];


var_dump(json_encode($commands));
