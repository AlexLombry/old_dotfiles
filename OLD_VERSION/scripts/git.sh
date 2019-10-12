#!/bin/bash

echo "Process to install gpg key"
echo 'brew install gpg'
echo 'gpg --full-generate-key'

echo 'gpg --list-secret-keys --keyid-format LONG'
echo 'gpg --armor --export KEY_WITH_PREVIOUS_COMMAND | pbcopy'

echo 'source ~/.zshrc'

echo 'git config --global commit.gpgsign true'
echo 'git config --global user.signingkey ID_KEY'
echo 'echo "test" | gpg --clearsign'
