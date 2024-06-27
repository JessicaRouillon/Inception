#!/bin/bash

sleep 3

cd	/var/www/html/wordpress

echo "\n------------------------------"
echo "------- Wordpress config -------"
echo "--------------------------------\n"

if [ -f "var/www/html/wp-config.php" ]
then
    echo "Warning /!\ Wordpress is already installed and configured.\n"
else
    # Configure wpdb
    wp config create --allow-root --dbname=$SQL_DATABASE \
                     --dbuser=$SQL_USER \
                     --dbpass=$SQL_PASSWORD \
                     --dbhost=$SQL_HOST \
		     --url=https://$DOMAIN_NAME;
    # Install wp
    wp core install  --allow-root \
                     --url=https://$DOMAIN_NAME \
                     --title=$WP_TITLE \
                     --admin_user=$WP_ADMIN \
                     --admin_password=$WP_PASSWORD \
                     --admin_email=$WP_ADMIN_EMAIL;
    # Create non admin user
    wp user create   --allow-root \
    		     $WP_USER $WP_USER_EMAIL \
                     --role=author \
                     --user_pass=$WP_USER_PASSWORD \;

    # Clear the object cache used by wp
    wp cache flush --allow-root

    # Give rw permissions to the web server
    #chown -R www-data:www-data /var/www/html/wp-content
    #chown -R www-data:www-data /var/www/html

    # it provides an easy-to-use interface for creating custom contact forms and managing submissions, as well as supporting various anti-spam techniques
    wp plugin install contact-form-7 --activate

    # set the site language to English
    wp language core install en_US --activate

    # remove default themes and plugins
    wp theme delete twentynineteen twentytwenty
    wp plugin delete hello

    # set the permalink structure
    wp rewrite structure '/%postname%/'

fi


if [ ! -d /run/php ]; then
  mkdir /run/php;
fi


# start the PHP FastCGI Process Manager (FPM) for PHP version 7.3 in the foreground
exec /usr/sbin/php-fpm7.3 -F -R
