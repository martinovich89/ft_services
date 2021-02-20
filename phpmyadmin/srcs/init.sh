#!/bin/sh

# Creating my_site directory
#mkdir -p /var/www/my_site

# Creating nginx user
#adduser -D -g 'www' www

# Giving exec rights to user www-data
#chown -R www:www /var/lib/nginx
#chown -R www:www /var/www/
#mkdir -p /run/nginx

# Moving to /tmp/ to download and configure pma, wp, and nginx
cd /tmp

# Installing phpmyadmin
#wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
tar -xvf phpMyAdmin-5.0.4-english.tar.gz
mv phpMyAdmin-5.0.4-english /var/www/my_site/phpmyadmin
rm phpMyAdmin-5.0.4-english.tar.gz
mv /tmp/phpmyadmin.inc.php /var/www/my_site/phpmyadmin/config.inc.php
# Moving phpmyadmin configuration source file to proper destination
#mv phpmyadmin.inc.php /var/www/my_site/phpmyadmin/config.inc.php
#mv index.php /var/www/my_site/phpmyadmin

cd /

# Installing wordpress
#wget -c https://wordpress.org/latest.tar.gz
#tar -xvf latest.tar.gz
#mv wordpress/ /var/www/my_site/
#rm latest.tar.gz

# Moving wordpress configuration source file to proper destination
#mv wp-config.php /var/www/my_site/wordpress

# Moving nginx configuration into proper destination / Creating link
#mv nginx1.conf /etc/nginx/sites-available/my_site_1
#mv nginx2.conf /etc/nginx/sites-available/my_site_2
#ln -s /etc/nginx/sites-available/my_site_1 /etc/nginx/sites-enabled/my_site_1
#rm /etc/nginx/sites-enabled/default
#cp srcs/nginx.conf /etc/nginx/conf.d/
#cp srcs/index.html /var/www/my_site/index.html

#cd

# Generating SSL certificate
mkdir -p /etc/nginx/ssl
openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/my_site.key \
	    -out /etc/nginx/ssl/my_site.crt -days 365 \
	    -subj '/C=FR/ST=75/L=Paris/O=42/OU=mhenry/CN=my_site'

# Setting up mariadb
#service mysql start
#echo "CREATE USER 'mhenry'@'localhost' IDENTIFIED BY 'pw';" | mariadb -u root
#echo "CREATE DATABASE wordpress;" | mariadb -u root
#echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'mhenry'@'localhost' IDENTIFIED BY 'pw';" | mariadb -u root
#echo "FLUSH PRIVILEGES;" | mariadb -u root

openrc
touch /run/openrc/softlevel
rc-service nginx start
rc-service php-fpm7 start
#service php7.3-fpm start
/bin/sh
