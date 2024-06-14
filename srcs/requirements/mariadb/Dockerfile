FROM    debian:bullseye

# Download
RUN     apt update && apt upgrade -y
RUN     apt install -y mariadb-server

# Copy configuration into container
COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf