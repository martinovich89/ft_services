#!/bin/sh

#until mysql
#do
#	echo "NO_UP"
#done

openrc
touch /run/openrc/softlevel
chmod 0755 /var/lib/mysql/
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'mhenry'@'%' IDENTIFIED BY 'pw';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'mhenry'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
#echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
#echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
#mysql wordpress -u root --password=  < wordpress.sql

/bin/sh