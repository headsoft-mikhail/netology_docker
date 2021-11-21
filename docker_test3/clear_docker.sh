docker rm $(docker ps -aq)
docker rmi $(docker images -aq)
docker ps -a
docker images -a
