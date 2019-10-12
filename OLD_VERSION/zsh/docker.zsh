function dshell() {
    (docker container exec -ti $1 bash) || (docker container exec -ti $1 sh);
}

alias d="docker"
alias docvker="docker"
alias dovker="docker"
alias docekr="docker"
alias dockver="docker"
alias fast="docker run --rm ddooo/fast"
alias ldc='lazydocker'
alias dsf="docker-compose exec app bin/console $1"
alias dump-docker="docker-compose exec php php /var/www/symfony/bin/console server:dump"
alias dc="docker-compose"
alias k="kubectl"

function buildtravis() {
    BUILDID="build-$RANDOM"
    INSTANCE="travisci/ci-garnet:packer-1512502276-986baf0"
    # Run the headless server
    docker run --name $BUILDID -dit $INSTANCE /sbin/init
    # Run the attached client
    docker exec -it $BUILDID bash -l
}

function reset_docker() {
    docker kill $(docker ps -q)

    echo "delete volumes? (y/n): "
    read volumes
    if [[ $volumes =~ ^[Yy]$ ]]; then
        docker volume rm $(docker volume ls -qf dangling=true)
    fi

    echo "delete networks? (y/n): "
    read networks
    if [[ $networks =~ ^[Yy]$ ]]; then
        docker network ls
        docker network ls | grep "bridge"
        docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
    fi

    echo "remove docker images? (y/n): "
    read images
    if [[ $images =~ ^[Yy]$ ]]; then
        docker images
        docker images rmi $(docker images --filter "dangling=true" -q --no-trunc)
        docker images | grep "none"
        docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')
    fi

    echo "remove docker containers? (y/n): "
    read containers
    if [[ $containers =~ ^[Yy]$ ]]; then
        docker kill $(docker ps -q)
        docker ps
        docker ps -a
        docker rm $(docker ps -qa --no-trunc --filter "status=exited")
    fi
}

function cleanup_docker() {
    docker system prune -fa
    docker rmi $(docker images -q -f dangling=true)
    docker rm $(docker ps -q -f status=exited)
}
