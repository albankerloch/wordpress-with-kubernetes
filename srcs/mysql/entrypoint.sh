#!/bin/sh

sed -i s/__MINI_IP__/$MINI_IP/g wordpress.sql

mysql_install_db --user=root

echo -ne "FLUSH PRIVILEGES;\n
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;\n
FLUSH PRIVILEGES;\n" >> init.sql

/usr/bin/mysqld --user=root --bootstrap --verbose=0 < init.sql
rm -rf init.sql

exec /usr/bin/mysqld --user=root
