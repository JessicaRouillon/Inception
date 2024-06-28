FROM    debian:bullseye

# Download
RUN     apt update && apt upgrade -y
RUN     apt install -y mariadb-server

# Copy configuration into container
COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN     mkdir -p /var/run/mysqld
RUN     chown -R mysql:mysql /var/run/mysqld/
RUN     chmod 755 /var/run/mysqld/

EXPOSE  3306

COPY    ./tools/mariadb_script.sh   ./
RUN     chmod +x ./mariadb_script.sh

ENTRYPOINT  ["bash", "./mariadb_script.sh"]
