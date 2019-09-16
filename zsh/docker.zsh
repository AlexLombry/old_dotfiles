function dshell() {
    (docker container exec -ti $1 bash) || (docker container exec -ti $1 sh);
}
alias fast="docker run --rm ddooo/fast"
alias ldc='lazydocker'
alias dsf="docker-compose exec app bin/console $1"
alias dump-docker="docker-compose exec php php /var/www/symfony/bin/console server:dump"
alias dc="docker-compose"
alias f="kubectl"
function buildtravis() {
    BUILDID="build-$RANDOM"
    INSTANCE="travisci/ci-garnet:packer-1512502276-986baf0"

    # Run the headless server
    docker run --name $BUILDID -dit $INSTANCE /sbin/init

    # Run the attached client
    docker exec -it $BUILDID bash -l
}
