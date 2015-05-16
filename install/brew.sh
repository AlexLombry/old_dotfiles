#!/bin/bash
# Install brew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# cli tools
brew install ack
brew install tree
brew install wget
brew install youtube-dl

# development tools
brew install git
brew install hub
brew install tmux
brew install zsh
brew install git-flow
brew install ccat
brew install Cmake

# Install Powerline for vim
# Powerline already configured on my .vimrc file
brew install python
brew install coreutils

brew install macvim --override-system-vim --with-cscope --with-lua --HEAD
# brew install macvim --override-system-vim

brew install vim --env-std --override-system-vim --with-lua
# brew install vim --env-std --override-system-vim
pip install git+git://github.com/powerline/powerline
git clone git://github.com/powerline/fonts.git ~/powerlinefonts
bash ~/powerlinefonts/install.sh
rm -rf ~/powerlinefonts
