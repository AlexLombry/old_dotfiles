#!/usr/bin/env bash
source ./lib.sh

bot "This script install Composer, Cocoapods, Pip"
ok

bot "Installing composer..."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

/usr/local/bin/composer global require friendsofphp/php-cs-fixer
/usr/local/bin/composer global require laravel/valet
/usr/local/bin/composer global require m6web/coke
/usr/local/bin/composer global require laravel/installer
/usr/local/bin/composer global require laravel/lumen-installer

