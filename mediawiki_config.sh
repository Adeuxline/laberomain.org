cat laberomain.org/files/mediawiki/LocalSettings.php >> /home/mediawiki/dev/LocalSettings.php

php /home/mediawiki/dev/maintenance/update.php
php /home/mediawiki/dev/maintenance/runJobs.php
php /home/mediawiki/dev/maintenance/namespaceDupes.php

#
# Lancement du parsing des données de Dofus
#
clear
mkdir /home/mediawiki/dev/data
echo "Lancement du parsing des données de Dofus..."
echo "Ressources"

echo "Armes"

echo "Equipements"
echo "Consommables"
echo "Harnachements"
echo "Familiers"
echo "Montures"
