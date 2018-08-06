# Script um die Nextcloud Einrichtung zu starten

# Script Variables

# Script Logic

# System Update
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y

# Add exception for SSH and then enable UFW firewall
sudo ufw allow OpenSSH
sudo ufw enable

# Rechte Anpassung der Scripts
echo "Rechte-Anpassung des install scripts"
sudo chmod +x ~/nextcloud/nc_install_step_01.sh

echo "Rechte-Anpassung des MySQL DB creat scripts"
sudo chmod +x ~/nextcloud/create_mysql_db.sh

echo "Rechte-Anpassung des Apache config scripts"
sudo chmod +x ~/nextcloud/nc_install_config_apache.sh

echo "Rechte-Anpassung des php.ini creat scripts"
sudo chmod +x ~/nextcloud/nc_install_phpini_apache.sh

echo "Rechte-Anpassung des variablen scripts"
sudo chmod +x ~/nextcloud/nc_install_variables.sh

echo "Rechte-Anpassung des Let's Encrypt scripts"
sudo chmod +x ~/nextcloud/nc_install_lets_encrypt.sh

# Start Script nc_install_step_01
#echo 'Aufruf der ersten Installationsdatei'
#./nc_install_step_01.sh