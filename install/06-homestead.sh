#!/bin/bash

echo "Installation of composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "Global require of homestead"
composer global require "laravel/homestead=~2.0"

echo "Add composer bin path into your zshrc file"
echo "\nexport PATH=\"/Users/$USER/.composer/vendor/bin:\$PATH"\" >> ~/.zshrc

echo "Source your zshrc file and init homestead"
source ~/.zshrc
