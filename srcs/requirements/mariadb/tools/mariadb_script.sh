echo "\n------------------------------"
echo "--- MaraiaDB database config ---"
echo "--------------------------------\n"

echo "MariaDB is starting...\n"
service mariadb start # demarrage du service
echo "${SQL_DATABASE} is being created"

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "FLUSH PRIVILEGES;" # refresh pour que MySQL prenne tout en compte
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${SQL_ROOT}'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;" # refresh pour que MySQL prenne tout en compte

sleep 1

# restart pour activer: shutdown pour pouvoir restart avec exec plus bas
mysqladmin -u${SQL_ROOT} -p${SQL_ROOT_PASSWORD} shutdown

echo "Database is ready !"

sleep 1

exec mysqld_safe

