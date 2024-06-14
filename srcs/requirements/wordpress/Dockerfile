FROM    debian:bullseye

# Download
RUN     apt update && apt upgrade -y
RUN     apt install -y \
            wget \
            php7.4 \
            php-fpm \
            php-mysql \
            mariadb-client

# RUN     mkdir -p /var/www/html /run/php

# Download Wordpress
RUN     wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN     cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Donner les droits a root
RUN     chown -R root:root /var/www/wordpress

# Download outil pour configurer le site wp
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Donner les droits
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp