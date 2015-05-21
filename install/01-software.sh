#!/bin/bash

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

exit
# Set computer name
mkdir ~/mac_installation
cd ~/mac_installation

echo "Download and installation section"

# Installing Chrome
echo "Google Chrome"
curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
hdiutil mount -nobrowse googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil unmount "/Volumes/Google Chrome"
rm googlechrome.dmg

# Installing Firefox
echo "Firefox"
curl -L -o Firefox.dmg "http://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US"
hdiutil mount -nobrowse Firefox.dmg
cp -R "/Volumes/Firefox/Firefox.app" /Applications
hdiutil unmount "/Volumes/Firefox"
rm Firefox.dmg

# Installing Skype
echo "Skype"
curl -L -O "http://www.skype.com/go/getskype-macosx.dmg"
hdiutil mount -nobrowse getskype-macosx.dmg
cp -R "/Volumes/Skype/Skype.app" /Applications
hdiutil unmount "/Volumes/Skype"
rm getskype-macosx.dmg

# Installing iterm2
echo "iTerm2"
curl -L -o iTerm2.zip "http://www.iterm2.com/downloads/stable/iTerm2_v2_0.zip"
unzip iTerm2.zip
mv iTerm.app /Applications
rm iTerm2.zip

# Installing Sequel Pro
echo "Sequel Pro"
curl -L -o sequel-pro.dmg "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg"
hdiutil mount -nobrowse sequel-pro.dmg
cp -R "/Volumes/Sequel Pro 1.0.2/Sequel Pro.app" /Applications
hdiutil unmount "/Volumes/Sequel Pro 1.0.2"
rm sequel-pro.dmg

# Installing GitHub
echo "Github"
curl -L -o mac_GitHub.zip "https://central.github.com/mac/latest"
unzip mac_GitHub.zip
mv GitHub.app /Applications
rm mac_GitHub.zip

rm -rf ~/mac_installation

echo Script finished

exit
