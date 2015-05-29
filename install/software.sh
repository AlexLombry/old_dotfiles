#!/bin/bash

# Set computer name
mkdir -p ~/mac_installation
cd ~/mac_installation

echo "Download and installation section (Only if you do not have the software)"

if [ ! -d /Applications/Google\ Chrome.app ]; then
    echo "Google Chrome"
    curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
    hdiutil mount -nobrowse googlechrome.dmg
    #cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
    hdiutil unmount "/Volumes/Google Chrome"
else
    echo "Google Chrome already installed"
fi

if [ ! -d /Applications/Firefox.app ]; then
    echo "Firefox"
    curl -L -o Firefox.dmg "http://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US"
    hdiutil mount -nobrowse Firefox.dmg
    #cp -R "/Volumes/Firefox/Firefox.app" /Applications
    hdiutil unmount "/Volumes/Firefox"
else
    echo "Firefox already installed"
fi

if [ ! -d /Applications/Skype.app ]; then
    echo "Skype"
    curl -L -O "http://www.skype.com/go/getskype-macosx.dmg"
    hdiutil mount -nobrowse getskype-macosx.dmg
    #cp -R "/Volumes/Skype/Skype.app" /Applications
    hdiutil unmount "/Volumes/Skype"
else
    echo "Skype already installed"
fi

if [ ! -d /Applications/Sequel\ Pro.app ]; then
    echo "Sequel Pro"
    curl -L -o sequel-pro.dmg "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg"
    hdiutil mount -nobrowse sequel-pro.dmg
    #cp -R "/Volumes/Sequel Pro 1.0.2/Sequel Pro.app" /Applications
    hdiutil unmount "/Volumes/Sequel Pro 1.0.2"
else
    echo "Sequel Pro already installed"
fi

if [ ! -d /Applications/iTerm.app ]; then
    echo "iTerm2"
    curl -L -o iTerm2.zip "http://www.iterm2.com/downloads/stable/iTerm2_v2_0.zip"
    unzip iTerm2.zip
    #mv iTerm.app /Applications
else
    echo "iTerm already installed"
fi

if [ ! -d /Applications/GitHub.app ]; then
    echo "Github"
    curl -L -o mac_GitHub.zip "https://central.github.com/mac/latest"
    unzip mac_GitHub.zip
    #mv GitHub.app /Applications
else
    echo "GitHub already installed"
fi

read -p "Do you want to remove the mac_installation folder which contains all installation file ? (y/n) " RESPA

if [ "$RESPA" = "y" ]; then
    rm -rf ~/mac_installation
fi

echo "Script finished"