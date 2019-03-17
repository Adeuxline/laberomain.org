#!/bin/bash

add-apt-repository ppa:certbot/certbot -y

apt update -y

sudo apt install nginx -y
systemctl start nginx
systemctl enable nginx

apt install imagemagick php7.0-fpm php7.0-intl php7.0-xml php7.0-curl php7.0-gd php7.0-mbstring php7.0-mysql php-apcu -y

rm /etc/php/7.0/fpm/php.ini
cp laberomain.org/files/php/php.ini /etc/php/7.0/fpm/php.ini
systemctl restart php7.0-fpm
systemctl enable php7.0-fpm

sudo apt install mysql-server mysql-client -y
systemctl start mysql
systemctl enable mysql

echo '##########################'
echo '#     MYSQL PASSWORD     #'
echo '##########################'
read -p "Enter your mysql password : " password

mysql -u root -p$password <<EOF
	create database mediawikidb;
	create database mediawikidev;
	grant all privileges on mediawikidb.* to mediawiki@'localhost' identified by 'mypassword';
	grant all privileges on mediawikidev.* to mediawiki@'localhost' identified by 'mypassword';
	flush privileges;
EOF

sudo apt install composer zip unzip -y

useradd mediawiki --home-dir=/home/mediawiki --create-home --uid=1001
mkdir /home/mediawiki/dev
mkdir /home/mediawiki/www

git clone https://gerrit.wikimedia.org/r/p/mediawiki/core.git --branch REL1_32 /home/mediawiki/dev

declare -a extensions=("CodeEditor"
                       "CodeMirror"
                       "WikiEditor"
                       "InputBox"
                       "ParserFunctions"
                       "Scribunto"
                       "SyntaxHighlight_GeSHi"
                       "AbuseFilter"
                       "AntiSpoof"
                       "ConfirmEdit"
                       "SpamBlacklist"
                       "TitleBlacklist"
                       "TorBlock"
                       "Variables"
                       "Loops"
                       "HeaderTabs");

for val in "${extensions[@]}"; do
	git clone https://github.com/wikimedia/mediawiki-extensions-$val.git /home/mediawiki/dev/extensions/$val
done

rm /home/mediawiki/dev/composer.local.json-sample
echo '{' > /home/mediawiki/dev/composer.local.json
echo '        "require": {' >> /home/mediawiki/dev/composer.local.json
echo '                "mediawiki/bootstrap": "1.3.0",' >> /home/mediawiki/dev/composer.local.json
echo '                "mediawiki/semantic-media-wiki": "3.0.1"' >> /home/mediawiki/dev/composer.local.json
echo '        }' >> /home/mediawiki/dev/composer.local.json
echo '}' >> /home/mediawiki/dev/composer.local.json

cd /home/mediawiki/dev/ && git submodule update --init && cd
composer update -d /home/mediawiki/dev --no-dev

chown -R www-data:www-data /home/mediawiki/dev

chmod a+x /home/mediawiki/dev/extensions/SyntaxHighlight_GeSHi/pygments/pygmentize
chmod a+x /home/mediawiki/dev/extensions/Scribunto/includes/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua

apt install certbot python-certbot-nginx letsencrypt -y
systemctl stop nginx
# certbot --nginx certonly -m 'info@laberomain.org' -n -d dev.dofus-wiki.org --agree-tos

cp laberomain.org/files/nginx/dev.dofus-wiki.org /etc/nginx/sites-available/dev.dofus-wiki.org
ln -s /etc/nginx/sites-available/dev.dofus-wiki.org /etc/nginx/sites-enabled/

fuser -k 80/tcp

systemctl start nginx

mysql -u root -pMXqREAi3 mediawikidev < laberomain.org/files/mediawiki/mediawikidev.sql

cp laberomain.org/files/mediawiki/LocalSettings.php /home/mediawiki/dev/
