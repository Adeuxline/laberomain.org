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

add-apt-repository ppa:ondrej/php -y
apt update
apt install apt-transport-https lsb-release -y
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt update

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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

#
# Other packages
#
apt install composer zip unzip automysqlbackup -y

apt-get dist-upgrade

apt-get autoremove

apt-get autoclean

exit
