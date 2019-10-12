#!/bin/bash

brew install docker docker-machine
brew install docker-machine-nfs xhyve docker-machine-driver-xhyve
brew tap codekitchen/dinghy
brew install dinghy

# docker-machine-driver-xhyve need root owner and uid
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# Create xhyve machine for Docker
dinghy create --provider=xhyve --cpus=4 --memory=4096
