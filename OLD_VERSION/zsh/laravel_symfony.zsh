function migrate() {
    if [[ -f "./artisan" ]]; then
        php artisan migrate $1
    else
        php bin/console doctrine:migrations:migrate $1
    fi
}

function rollback() {
    if [[ -f "./artisan" ]]; then
        php artisan migrate:rollback
    else
        php bin/console doctrine:migrations:migrate prev
    fi
}

function fixtures() {
    if [[ -f "./artisan" ]]; then
        php artisan db:seed
    else
        php bin/console hautelook:fixtures:load --purge-with-truncate -n
    fi
}

function laraclean() {
    if [[ -f "./artisan" ]]; then
        php artisan cache:clear;
        php artisan config:clear;
        php artisan optimize:clear;
        php artisan route:clear;
        php artisan view:clear;
    else
        php bin/console cache:clear
        php bin/console doctrine:cache:clear-metadata
        php bin/console doctrine:cache:clear-query
        php bin/console doctrine:cache:clear-result
    fi

    composer dump-autoload -o
}
