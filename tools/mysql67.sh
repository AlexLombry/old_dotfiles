#!/bin/bash

docker stop mysql57
docker rm mysql57

docker pull mysql/mysql-server:5.7
docker run --name=mysql57 -d mysql/mysql-server:5.7

docker logs mysql57 2>&1 | grep GENERATED | cut -d" " -f5
echo "Launch into mysql: ALTER USER 'root'@'localhost' IDENTIFIED BY 'password'"
echo "Then you can work"

docker exec -it mysql57 mysql -uroot -p
