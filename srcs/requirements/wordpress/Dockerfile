FROM        debian:bullseye

# Download
RUN         apt update && apt upgrade -y
RUN         apt install -y \
                wget \
                php7.4 \
                php-fpm \
                php-mysql \
                mariadb-client


# Repo pour stocker les fichiers wp et php-fpm
RUN         mkdir -p /var/www/html /run/php

# Copy les config dans le container
COPY        conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN         chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

# Copy le script dans le container
COPY        tools/wordpress_script.sh /usr/local/bin/wordpress_script.sh
RUN         chmod 755 /usr/local/bin/wordpress_script.sh

# Download Wordpress
RUN         wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN         cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN         chown -R root:root /var/www/wordpress

# Download outil pour configurer le site wp (CLI)
RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x wp-cli.phar
RUN         mv wp-cli.phar /usr/local/bin/wp


WORKDIR     /var/www/html

EXPOSE      9000

ENTRYPOINT  ["sh", "/usr/local/bin/wordpress_script.sh"]