FROM    debian:bullseye

# Download
RUN     apt update && apt upgrade -y
RUN     apt install -y \
            openssl \
            vim \
            nginx

# Gestion / Creation de OpenSSL certificate (Transport Layer Security)
RUN     mkdir -p /etc/nginx/ssl
RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jrouillo.42.fr/UID=jrouillo"
# 1/ Genere un certificat SSL et une cle
# 2/ Les enregistre dans un fichier chacun
# 3/ Donner les parametres pour le certificat

# Stocker les dossiers de stockage de Nginx
RUN     mkdir -p /var/run/nginx
COPY    conf/nginx.conf /etc/nginx/nginx.conf

# Droits d' acces aux fichiers
#RUN     mkdir -p /var/www/html
RUN     chmod -R 755 /var/www/html
RUN     chown -R www-data:www-data /var/www/html 
# chown changes the ownership to www-data user and group

#EXPOSE  443

CMD [ "nginx", "-g", "daemon off;" ]
