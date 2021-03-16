#docker network create -d bridge my_network \
if output=$(docker ps -aq)  &&  [ -z "$output" ]
then
    docker build -t mysql_img ./mysql
    docker build -t wp_img ./wordpress
    docker build -t pma_img ./phpmyadmin
    docker build -t nginx_img ./nginx
    docker build -t influxdb_img ./influxdb
    docker build -t telegraf_img ./telegraf
    docker build -t ftps_img ./ftps
    docker build -t grafana_img ./grafana
    docker run --name wp_container -itd -p 5050:80 --network=my_network wp_img
    docker run --name mysql_container -itd -p 3306:3306 --network=my_network mysql_img
    docker run --name pma_container -itd -p 5000:5000 --network=my_network pma_img
    docker run --name nginx_container -itd -p 80:80 -p 443:443 --network=my_network nginx_img
    docker run --name influxdb_container -itd -p 8086:8086 --network=my_network influxdb_img
    docker run --name telegraf_container -tid -e USER -e MINIKUBE_IP=172.17.0.3 -v /var/run/docker.sock:/var/run/docker.sock:ro --net=my_network -p 4999:4999 telegraf_img
    docker run --name ftps_container -itd -p 21:21 --network=my_network ftps_img
    docker run --name grafana_container -itd -p 3000:3000 --net=my_network grafana_img
else
    docker stop $(docker ps -qa)
    docker container rm $(docker ps -qa)
    docker rmi -f $(docker images -qa)
    docker build -t mysql_img ./mysql
    docker build -t wp_img ./wordpress
    docker build -t pma_img ./phpmyadmin
    docker build -t nginx_img ./nginx
    docker build -t influxdb_img ./influxdb
    docker build -t telegraf_img ./telegraf
    docker build -t ftps_img ./ftps
    docker build -t grafana_img ./grafana
    docker run --name wp_container -itd -p 5050:80 --network=my_network wp_img
    docker run --name mysql_container -itd -p 3306:3306 --network=my_network mysql_img
    docker run --name pma_container -itd -p 5000:5000 --network=my_network pma_img
    docker run --name nginx_container -itd -p 80:80 -p 443:443 --network=my_network nginx_img
    docker run --name influxdb_container -itd -p 8086:8086 --network=my_network influxdb_img
    docker run --name telegraf_container -tid -e USER -e MINIKUBE_IP=172.17.0.3 -v /var/run/docker.sock:/var/run/docker.sock:ro --net=my_network -p 4999:4999 telegraf_img
    docker run --name ftps_container -itd -p 21:21 --network=my_network ftps_img
    docker run --name grafana_container -itd -p 3000:3000 --net=my_network grafana_img
fi