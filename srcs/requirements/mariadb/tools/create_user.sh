#!/bin/bash

service mysql start

echo "CREATE DATABASE ${DB_NAME};" | mysql -u root
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" | mysql -u root
