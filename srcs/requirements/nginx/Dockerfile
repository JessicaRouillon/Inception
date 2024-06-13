FROM    debian:bullseye

# Download
RUN     apt update && apt upgrade -y && apt install -y \
            openssl \
            vim \
            nginx

# Gestion / Creation de OpenSSL certificate (Transport Layer Security)
RUN     mkdir -p /etc/nginx/ssl
RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jrouillo.42.fr/UID=jrouillo"

# Stocker les dossiers de stockage de Nginx
RUN     mkdir -p /var/run/nginx
COPY    conf/nginx.conf /etc/nginx/nginx.conf

# Droits d' acces aux fichiers
RUN     mkdir -p /var/www/html
RUN     chmod 755 /var/www/html
#RUN     chown -R www-data:www-data /var/www/html

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

EXPOSE  443