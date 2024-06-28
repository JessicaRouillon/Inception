FROM	debian:bullseye

# Download
RUN	apt update && apt upgrade -y
RUN	apt install -y \
                wget \
                php7.4 \
                php-fpm \
                php-mysql \
                mariadb-client


# Copy les config dans le container

RUN mkdir -p /run/php

COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN	chmod 755 /etc/php/7.4/fpm/pool.d/www.conf


# Download outil pour configurer le site wp (CLI)
RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x wp-cli.phar
RUN         mv wp-cli.phar /usr/local/bin/wp


RUN			mkdir -p /var/www/html
WORKDIR     /var/www/html


EXPOSE      9000


COPY ./tools/wordpress_script.sh /usr/local/bin/wordpress_script.sh
RUN chmod +x /usr/local/bin/wordpress_script.sh


ENTRYPOINT  ["bash", "/usr/local/bin/wordpress_script.sh"]
