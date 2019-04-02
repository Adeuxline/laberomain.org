#!/bin/bash

add-apt-repository ppa:certbot/certbot -y

apt update -y
apt dist-upgrade -y

#
# SERVEUR WEB - NGINX
#

sudo apt install nginx -y
systemctl start nginx
systemctl enable nginx

#
# PHP POUR MEDIAWIKI
#


apt install imagemagick php7.3-fpm php7.3-intl php7.3-xml php7.3-curl php7.3-gd php7.3-mbstring php7.3-mysql php-apcu -y

rm /etc/php/7.3/fpm/php.ini
cp laberomain.org/files/php/php.ini /etc/php/7.3/fpm/php.ini
systemctl restart php7.3-fpm
systemctl enable php7.3-fpm

#
# MYSQL SERVEUR
#

sudo apt install mysql-server mysql-client -y
systemctl start mysql
systemctl enable mysql

#
# CERTIFICATS SSL
#

apt install certbot python-certbot-nginx letsencrypt -y

#
# UPDATE NODEJS
#

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install node

#
# Other packages
#
apt install composer zip unzip -y

exit
