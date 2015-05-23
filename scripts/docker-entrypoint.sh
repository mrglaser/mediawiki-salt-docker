#!/bin/bash


# start mysql
/usr/bin/mysqld_safe &
sleep 10s

if [ ! -f /var/www/wiki/LocalSettings.php ]; then

php /var/www/wiki/maintenance/install.php --dbserver="127.0.0.1" --dbuser="root" --dbpass=""  --pass="hallowelt" MyWiki WikiSysop

fi

# start apache
/usr/sbin/apache2ctl -D FOREGROUND

#/etc/init.d/apache2 start