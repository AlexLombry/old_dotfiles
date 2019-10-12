#!/usr/bin/env bash
source ~/dotfiles/macos/lib.sh

running "Prepare macOS system"
bash ./macos/macos.sh
ok

running "Install software"
bash ./macos/software.sh
ok

running "Install vim"
bash ./macos/vim.sh
ok

running "Install links"
bash ./macos/links.sh
ok
