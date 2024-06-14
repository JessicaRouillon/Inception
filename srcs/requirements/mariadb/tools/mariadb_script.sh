echo "\n------------------------------"
echo "--- MaraiaDB database config ---"
echo "--------------------------------\n"

if [ -d "/var/lib/mysql/${SQL_DATABASE}"]
then
    echo "Warning /!\  Database ${SQL_DATABASE} already exists.\n"
else
    echo "MariaDB is starting...\n"
    service mariadb start # demarrage du service
    sleep 1
    echo "${SQL_DATABASE} is being created"
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED  BY '${SQL_ROOT_PASSWORD}';"
    sleep 1
    mysql -e "FLUSH PRIVILEGES;" # refresh pour que MySQL prenne tout en compte
    
    # restart pour activer: shutdown pour pouvoir restart avec exec plus bas
    mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
    echo "Database is ready !"
clear_env= no;
listen=wordpress:9000;
fi
sleep 1

exec mysqld_safe
