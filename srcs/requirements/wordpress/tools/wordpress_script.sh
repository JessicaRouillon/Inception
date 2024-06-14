sleep 3

echo "\n------------------------------"
echo "------- Wordpress config -------"
echo "--------------------------------\n"

if [ -f "var/www/html/wp-config.php" ]
then
    echo "Warning /!\ Wordpress is already installed and configured.\n"
else
    wp core download --allow--root # download wp core
    # Configure wpdb
    wp core config  --allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=$SQL_HOST
    # Install wp
    wp core install --allow-root \
                    --url=$ADMIN \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$WP_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL
    # Create non admin user
    wp user create $WP_USER $WP_USER_EMAIL \
                    --role=author \
                    --user_pass=$WP_USER_PASSWORD \
                    --allow-root
    
    # Give rw permissions to the web server
    chown -R www-data:www-data /var/www/html/wp-content
    chown -R www-data:www-data /var/www/html

fi
