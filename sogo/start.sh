#!/bin/bash

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-sogo}
SERVER_PROTOCOL=${SERVER_PROTOCOL:-http}
SERVER_NAME=${SERVER_NAME:-localhost}
SERVER_PORT=${SERVER_PORT:-80}

# database settings
mysql -h mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS sogo CHARSET='UTF8';"
mysql -h mysql -u root -p${MYSQL_ROOT_PASSWORD} -D sogo -e "CREATE TABLE sogo_users (c_uid VARCHAR(10) PRIMARY KEY, c_name VARCHAR(10), c_password VARCHAR(32), c_cn VARCHAR(128), mail VARCHAR(128));"

# sogo server settings
sudo -u sogo defaults write sogod SOGoUserSources "({canAuthenticate = YES; displayName = \"SOGo Users\"; id = users; isAddressBook = YES; type = sql; userPasswordAlgorithm = md5; viewURL =\"mysql://root:${MYSQL_ROOT_PASSWORD}@mysql:3306/sogo/sogo_users\";})"
sudo -u sogo defaults write sogod SOGoProfileURL "mysql://root:${MYSQL_ROOT_PASSWORD}@mysql:3306/sogo/sogo_user_profile"
sudo -u sogo defaults write sogod OCSFolderInfoURL "mysql://root:${MYSQL_ROOT_PASSWORD}@mysql:3306/sogo/sogo_folder_info"
sudo -u sogo defaults write sogod OCSSessionsFolderURL "mysql://root:${MYSQL_ROOT_PASSWORD}@mysql:3306/sogo/sogo_sessions_folder"
sudo -u sogo defaults write sogod WOPort '0.0.0.0:20000'

# apache settings
sed -i "s/443/${SERVER_PORT}/g" /etc/apache2/conf-available/SOGo.conf
sed -i "s/https:\/\/yourhostname/${SERVER_PROTOCOL}:\/\/${SERVER_NAME}:${SERVER_PORT}/g" /etc/apache2/conf-available/SOGo.conf
sed -i "s/yourhostname/${SERVER_NAME}/g" /etc/apache2/conf-available/SOGo.conf

echo -e "ServerName ${SERVER_NAME}:${SERVER_PORT}\n\
$(cat /etc/apache2/conf-available/SOGo.conf)" > /etc/apache2/conf-available/SOGo.conf


/etc/init.d/sogo start
tail -f /var/log/sogo/sogo.log
