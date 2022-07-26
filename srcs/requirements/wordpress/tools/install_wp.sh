#!bin/bash

mkpir -p /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
chown www-data:www-data /var/www/wordpress
cd /var/www/wordpress
sudo -u www-data wp core download

sudo -u www-data \
wp core config	--dbhost=$DB_HOST \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASSWORD \

sudo -u www-data \
wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \

sudo -u www-data \
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD
