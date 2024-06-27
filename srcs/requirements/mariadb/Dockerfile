FROM    debian:bullseye

# Download
RUN     apt update && apt upgrade -y
RUN     apt install -y mariadb-server

# Copy configuration into container
COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Create the repositories and give permissions
#RUN     mkdir -p /home/jrouillo/data/mariadb
#RUN     mkdir -p /home/jrouillo/data/wordpress
#RUN     sudo chown -R $(whoami):$(whoami) /home/jrouillo/data/mariadb
#RUN     sudo chown -R $(whoami):$(whoami) /home/jrouillo/data/wordpress
#RUN     sudo chmod -R 755 /home/jrouillo/data/wordpress
#RUN     sudo chmod -R 755 /home/jrouillo/data/mariadb


RUN     mkdir -p /var/run/mysqld
RUN     mkdir -p /var/lib/mysql
RUN     chown mysql:mysql /var/run/mysqld/
RUN     chmod -R 755 /var/run/mysqld/
RUN     chown mysql:mysql /var/lib/mysql/
RUN     chmod -R 755 /var/lib/mysql/

EXPOSE  3306

COPY    ./tools/mariadb_script.sh   ./
RUN     chmod +x ./mariadb_script.sh

ENTRYPOINT  ["bash", "./mariadb_script.sh"]
