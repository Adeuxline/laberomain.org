# Lancer les commandes suivantes dans l'ordre.

apt-get install git -y
git clone https://www.github.com/Adeuxline/laberomain.org.git

apt-get remove docker docker-engine docker.io containerd runc

add-apt-repository ppa:certbot/certbot

apt-get update

apt-get install nginx python3-pip npm nodejs imagemagick php7.0-fpm php7.0-intl php7.0-xml php7.0-curl php7.0-gd php7.0-mbstring php7.0-mysql php-apcu software-properties-common certbot python-certbot-nginx composer zip unzip letsencrypt mysql-server mysql-client -y

pip3 install pip --upgrade

apt-get dist-upgrade -y
apt-get autoremove -y
apt-get autoclean -y

systemctl start nginx
systemctl enable nginx

vi /etc/php/7.0/fpm/php.ini
#EDIT
upload_max_filesize = 20M
memory_limit = 128M

systemctl restart php7.0-fpm
systemctl enable php7.0-fpm

systemctl start mysql
systemctl enable mysql

mysql -u root -p

create database mediawikidb;
create database mediawikidb_dev;
grant all privileges on mediawikidb.* to mediawiki@'localhost' identified by 'mypassword';
grant all privileges on mediawikidb_dev.* to mediawiki@'localhost' identified by 'mypassword';
flush privileges;
exit;

useradd odoo --home-dir=/home/odoo --create-home --uid=1000
mkdir /home/mediawiki /home/api /home/nadekoBot
mkdir /home/mediawiki/dev /home/mediawiki/dofus /home/mediawiki/www /home/mediawiki/endlessfrontier /home/mediawiki/hitchwiki


git clone https://gerrit.wikimedia.org/r/p/mediawiki/core.git /home/mediawiki/dev/
git clone https://gerrit.wikimedia.org/r/mediawiki/skins/Vector /home/mediawiki/dev/skins/Vector/
composer install --no-dev -d /home/mediawiki/dev/
#INSTALL Mediawiki manually
scp LocalSettings.php root@laberomain.org:/home/mediawiki/dev/
chown -R www-data:www-data /home/mediawiki/dev/

certbot --nginx certonly -m 'info@laberomain.org' -n -d www.laberomain.org -d dev.laberomain.org -d dofus.laberomain.org -d endlessfrontier.laberomain.org -d hitchwiki.laberomain.org --agree-tos

wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/1.9/linuxAIO.sh /home/nadekoBot/

************
*  DOCKER  *
************
systemctl stop nginx
git clone https://github.com/api-platform/api-platform.git /home/api/
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /home/api/
docker-compose pull
docker-compose up
cd
systemcl start nginx


