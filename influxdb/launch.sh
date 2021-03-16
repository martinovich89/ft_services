docker build -t influxdb_img ./influxdb
docker run --name influxdb_container -tid \
                        -e USER \
                        --net=my_network \
                        -p 8086:8086 influxdb_img