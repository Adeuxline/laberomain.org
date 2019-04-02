#!/bin/bash

systemctl restart php7.0-fpm
systemctl enable php7.0-fpm

systemctl start mysql
systemctl enable mysql

mysql -u root -p <<EOF
	create database mediawikidb;
	create database mediawikidev;
	grant all privileges on mediawikidb.* to mediawiki@'localhost' identified by 'mypassword';
	grant all privileges on mediawikidev.* to mediawiki@'localhost' identified by 'mypassword';
	flush privileges;
EOF

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
                       "HeaderTabs"
                       "PageForms");

for val in "${extensions[@]}"; do
	git clone https://github.com/wikimedia/mediawiki-extensions-$val.git /home/mediawiki/dev/extensions/$val
done

rm /home/mediawiki/dev/composer.local.json-sample
echo '{' > /home/mediawiki/dev/composer.local.json
echo '        "require": {' >> /home/mediawiki/dev/composer.local.json
echo '                "mediawiki/bootstrap": "1.3.0",' >> /home/mediawiki/dev/composer.local.json
echo '                "mediawiki/semantic-media-wiki": "3.0.1"' >> /home/mediawiki/dev/composer.local.json
echo '                "mediawiki/semantic-result-formats": "3.0.0"' >> /home/mediawiki/dev/composer.local.json
echo '        }' >> /home/mediawiki/dev/composer.local.json
echo '}' >> /home/mediawiki/dev/composer.local.json

cd /home/mediawiki/dev/ && git submodule update --init && cd
composer update -d /home/mediawiki/dev --no-dev

chown -R www-data:www-data /home/mediawiki/dev

chmod a+x /home/mediawiki/dev/extensions/SyntaxHighlight_GeSHi/pygments/pygmentize
chmod a+x /home/mediawiki/dev/extensions/Scribunto/includes/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua

systemctl stop nginx
certbot --nginx certonly -m 'info@laberomain.org' -n -d dev.dofus-wiki.org --agree-tos

cp laberomain.org/files/nginx/dev.dofus-wiki.org /etc/nginx/sites-available/dev.dofus-wiki.org
ln -s /etc/nginx/sites-available/dev.dofus-wiki.org /etc/nginx/sites-enabled/

fuser -k 80/tcp

systemctl start nginx

echo "******************************"
echo "* OPERATION MANUELLE REQUISE *"
echo "******************************"
echo "Mot de passe de l'utilisateur Mediawiki ?"
sudo passwd mediawiki
echo "1. Se connecter sur https://dev.dofus-wiki.org/"
echo "2. Installer Mediawiki sans aucune extension"
echo "3. Placer le fichier LocalSettings.php dans la racine de Mediawiki"
echo "4. Lancer le scipt Mediawiki_config.sh"
