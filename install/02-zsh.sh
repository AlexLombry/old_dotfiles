#!/bin/bash

# Installer Oh-My-Zsh
echo "Install Oh-My-Zsh"
curl -L http://install.ohmyz.sh | sh

echo "configuring zsh as default shell"
chsh -s $(which zsh)