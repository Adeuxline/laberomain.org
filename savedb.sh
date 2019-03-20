#!/bin/bash

mysql -u root -p <<EOF
	show databases;
EOF

path="/root/laberomain.org/files/mediawiki/"

read -p "Quelle database sauver ?" db
old="_old"
name="$db$old"

rm $path$name.sql
mv $path$db.sql $path$name.sql

mysqldump -u root -p -p $db > $path$db.sql
