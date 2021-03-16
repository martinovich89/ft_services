docker network ls | grep "my_network"
docker inspect my_network
#docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
docker ps -a && docker images -a