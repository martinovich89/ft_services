if output=$(docker ps -aq)  &&  [ -z "$output" ]
then
    docker build -t influxdb_img ./influxdb
    docker build -t telegraf_img ./telegraf
    docker run --name influxdb_container -itd -p 8086:8086 --network=my_network influxdb_img
    docker run --name telegraf_container -tid -e USER -e MINIKUBE_IP=172.17.0.3 -v /var/run/docker.sock:/var/run/docker.sock:ro --net=my_network -p 4999:4999 telegraf_img
else
    docker stop influxdb_container telegraf_container
    docker rm influxdb_container telegraf_container
    docker rmi -f influxdb_img telegraf_img
    docker build -t influxdb_img ./influxdb
    docker build -t telegraf_img ./telegraf
    docker run --name influxdb_container -itd -p 8086:8086 --network=my_network influxdb_img
    docker run --name telegraf_container -tid -e USER -e MINIKUBE_IP=172.17.0.3 -v /var/run/docker.sock:/var/run/docker.sock:ro --net=my_network -p 4999:4999 telegraf_img
fi