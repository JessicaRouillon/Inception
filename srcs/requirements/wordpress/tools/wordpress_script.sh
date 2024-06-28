#!/bin/bash

sleep 3

echo "\n------------------------------"
echo "------- Wordpress config -------"
echo "--------------------------------\n"

if [ -f "var/www/html/wp-config.php" ]
then
    echo "Warning /!\ Wordpress is already installed and configured.\n"
else
	wp core download --allow-root
    # Configure wpdb
	wp core config   --dbname=${SQL_DATABASE} \
                     --dbuser=${SQL_USER} \
                     --dbpass=${SQL_PASSWORD} \
                     --dbhost=${SQL_HOST} \
 					 --allow-root 

    # Install wp
    wp core install  --url=${DOMAIN_NAME} \
                     --title=${SITE_TITLE} \
                     --admin_user=${ADMIN_USER} \
                     --admin_password=${ADMIN_PASSWORD} \
                     --admin_email=${ADMIN_EMAIL} \
					 --allow-root;
    # Create non admin user
    wp user create ${USER1_LOGIN} ${USER1_MAIL} \
                     --role=author \
                     --user_pass=${USER1_PASS} \
					 --allow-root;

fi

wp plugin list --allow-root

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# start the PHP FastCGI Process Manager (FPM) for PHP version 7.3 in the foreground
exec /usr/sbin/php-fpm7.4 -F
