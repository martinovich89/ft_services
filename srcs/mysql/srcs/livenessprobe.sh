#!/bin/sh

mysql --user=root << EOF
SHOW DATABASES;
EOF

#echo "SHOW DATABASES" | mysql -u root --skip-password