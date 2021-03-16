#docker network create -d bridge my_network \
if output=$(docker ps -aq)  &&  [ -z "$output" ]
then
    docker build -t mysql_img ./mysql
    docker build -t wp_img ./wordpress
    docker build -t pma_img ./phpmyadmin
    docker run --name wp_container -itd -p 5050:80 --network=my_network wp_img
    docker run --name mysql_container -itd -p 3306:3306 --network=my_network mysql_img
    docker run --name pma_container -itd -p 5000:5000 --network=my_network pma_img
else
    docker stop $(docker ps -qa)
    docker container rm $(docker ps -qa)
    docker rmi -f $(docker images -qa)
    docker build -t mysql_img ./mysql
    docker build -t wp_img ./wordpress
    docker build -t pma_img ./phpmyadmin
    docker run --name wp_container -itd -p 5050:80 --network=my_network wp_img
    docker run --name mysql_container -itd -p 3306:3306 --network=my_network mysql_img
    docker run --name pma_container -itd -p 5000:5000 --network=my_network pma_img
fi