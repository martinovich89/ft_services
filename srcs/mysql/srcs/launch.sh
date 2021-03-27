#!/bin/sh

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start

# Waiting for mariadb to actually start
UP=$(pgrep mariadb | wc -l);
while [ "$UP" -ne 1 ];
do
        sleep 3
        UP=$(pgrep mariadb | wc -l);
done

echo  "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo  "CREATE USER 'mhenry'@'%' IDENTIFIED BY 'pw';" | mysql -u root --skip-password
echo  "GRANT ALL ON *.* TO 'mhenry'@'%' IDENTIFIED BY 'pw' WITH GRANT OPTION;" | mysql -u root --skip-password
echo  "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# Applying site configuration to wordpress database
mysql --user=root wordpress < wordpress.sql

tail -F /dev/null