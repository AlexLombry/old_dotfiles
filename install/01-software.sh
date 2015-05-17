#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set computer name
sudo scutil --set ComputerName "HakShinKen"
sudo scutil --set HostName "HakShinKen"
sudo scutil --set LocalHostName "shinken"

mkdir ~/mac_installation
cd ~/mac_installation

# Installing Chrome
curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
hdiutil mount -nobrowse googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil unmount "/Volumes/Google Chrome"
rm googlechrome.dmg

# Installing Firefox
curl -L -o Firefox.dmg "http://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US"
hdiutil mount -nobrowse Firefox.dmg
cp -R "/Volumes/Firefox/Firefox.app" /Applications
hdiutil unmount "/Volumes/Firefox"
rm Firefox.dmg

# Installing Skype
curl -L -O "http://www.skype.com/go/getskype-macosx.dmg"
hdiutil mount -nobrowse getskype-macosx.dmg
cp -R "/Volumes/Skype/Skype.app" /Applications
hdiutil unmount "/Volumes/Skype"
rm getskype-macosx.dmg

# Installing Dropbox
curl -L -o Dropbox.dmg "https://www.dropbox.com/download?plat=mac"
hdiutil mount -nobrowse Dropbox.dmg
cp -R "/Volumes/Dropbox Installer/Dropbox.app" /Applications
hdiutil unmount "/Volumes/Dropbox Installer"
rm Dropbox.dmg

# Installing iterm2
curl -L -o iTerm2.zip "http://www.iterm2.com/downloads/stable/iTerm2_v2_0.zip"
unzip iTerm2.zip
mv iTerm.app /Applications
rm iTerm2.zip

# Installing Sequel Pro
curl -L -o sequel-pro.dmg "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg"
hdiutil mount -nobrowse sequel-pro.dmg
cp -R "/Volumes/Sequel Pro 1.0.2/Sequel Pro.app" /Applications
hdiutil unmount "/Volumes/Sequel Pro 1.0.2"
rm sequel-pro.dmg

# Installing GitHub
curl -L -o mac_GitHub.zip "https://central.github.com/mac/latest"
unzip mac_GitHub.zip
mv GitHub.app /Applications
rm mac_GitHub.zip

# Installing 1Password
echo Download 1Password BY

# Installing Alfred
echo Download Alfred BY

# Installing The Unarchiver
echo Download The Unarchiver BY

rm -rf ~/mac_installation

echo Script finished

exit
