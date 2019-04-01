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


apt install imagemagick php7.0-fpm php7.0-intl php7.0-xml php7.0-curl php7.0-gd php7.0-mbstring php7.0-mysql php-apcu -y

rm /etc/php/7.0/fpm/php.ini
cp laberomain.org/files/php/php.ini /etc/php/7.0/fpm/php.ini
systemctl restart php7.0-fpm
systemctl enable php7.0-fpm

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

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install node

#
# Installe DOCKER
#

sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
