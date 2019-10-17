#!/usr/bin/env bash
source ~/dotfiles/scripts/zsh/functions.zsh

running "Install Powerline shell"
mkdir -p ~/Code/
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
sudo python setup.py install
mkdir -p ~/.config/powerline-shell && powerline-shell --generate-config > ~/.config/powerline-shell/config.json
ok
