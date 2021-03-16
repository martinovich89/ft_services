#!/bin/sh

#mkdir -p /var/www/monsite
#chown -R www-data /var/www/monsite
#chmod -R 755 /var/www/monsite
#mv /tmp/index.html  /var/www/monsite/

# 1e methode pour installer nginx.conf
#mv /tmp/nginx.conf  /etc/nginx/sites-available/monsite
#ln -s /etc/nginx/sites-available/monsite /etc/nginx/sites-enabled/monsite
#rm /etc/nginx/sites-enabled/default

# 2e methode (meme chose que la 1e en moins bien)
#rm /etc/nginx/sites-enabled/default
#mv /tmp/nginx.conf /etc/nginx/sites-enabled/monsite

# 3e methode (utilisation de conf.d, oblige de commenter "include /etc/nginx/sites-enabled;" dans /etc/nginx/nginx.conf)
#sed -i 's/include \/etc\/nginx\/sites-enabled/#include \/etc\/nginx\/sites-enabled/' /etc/nginx/nginx.conf
#mv /tmp/nginx.conf /etc/nginx/conf.d/default.conf

service nginx start
bash