FROM	debian:bullseye

# Download
RUN	apt update && apt upgrade -y
RUN	apt install -y \
                wget \
                php7.4 \
                php-fpm \
                php-mysql \
                mariadb-client


# Repo pour stocker les fichiers wp et php-fpm
#RUN         mkdir -p /var/www/html /run/php

# Copy les config dans le container

RUN mkdir -p /run/php

COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN	chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x wp-cli.phar
RUN         mv wp-cli.phar /usr/local/bin/wp


RUN			mkdir -p /var/www/html
WORKDIR     /var/www/html

EXPOSE      9000

COPY ./tools/wordpress_script.sh /usr/local/bin/wordpress_script.sh
RUN chmod +x /usr/local/bin/wordpress_script.sh


ENTRYPOINT  ["bash", "/usr/local/bin/wordpress_script.sh"]


# Copy le script dans le container

# Download Wordpress
# RUN	wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www
# RUN	cd /var/www
# # RUN	tar -xzf wordpress-6.4-fr_FR.tar.gz
# # RUN	rm wordpress-6.4-fr_FR.tar.gz  
# # RUN	cp -r /var/www/wordpress/. /var/www/html
# # RUN	rm -rf /var/www/wordpress
# # RUN	chown -R root:root /var/www/html

# Give web server the necessary permisssions
# RUN	    chown -R www-data:www-data /var/www/*
# RUN	    chmod -R 755 /var/www/*
#RUN         chown -R root:root /var/www/wordpress

# Download outil pour configurer le site wp (CLI)
