if output=$(docker ps -aq | grep "nginx")  &&  [ -z "$output" ]
then
    docker build -t nginx_img ./nginx
    docker run --name nginx_container -itd -p 80:80 --network=my_network nginx_img
else
    docker stop nginx_container
    docker rm nginx_container
    docker rmi -f nginx_img
    docker build -t nginx_img ./nginx
    docker run --name nginx_container -itd -p 80:80 -p 443:443 --network=my_network nginx_img
fi