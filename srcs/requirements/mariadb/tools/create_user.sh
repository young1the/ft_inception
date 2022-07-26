#!/bin/bash

service mysql start

echo "CREATE DATABASE ${DB_NAME};" | mysql -u root -e
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u root -e
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" | mysql -u root -e 
echo "FLUSH PRIVILEGES;" | mysql -u root -e
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" | mysql -u root -e
