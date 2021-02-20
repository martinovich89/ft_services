docker stop $(docker ps -qa)
docker container rm $(docker ps -qa)
docker rmi -f $(docker images -qa)