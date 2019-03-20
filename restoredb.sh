#!/bin/bash

ls -l /root/laberomain.org/files/mediawiki/*.sql
read -p "Quelle database restaurer ?" db
mysql -u root -p $db < /root/laberomain.org/files/mediawiki/$db.sql
