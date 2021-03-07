#!/usr/bin/env bash
source ~/dotfiles/zsh/functions.zsh

running "Installation of Keep Your Mac Stuff Updated"
mkdir -p "$HOME/.installation"
[ ! -d "$HOME/.installation/kymsu/" ] && git clone git@github.com:AlexLombry/kymsu.git "$HOME/.installation/kymsu"
cd "$HOME/.installation/kymsu" && ./install.sh
ok
