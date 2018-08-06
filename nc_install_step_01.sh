# Script Variables


# Script Logic

# Install Apache2
echo 'Installation von Apache2'
sudo apt-get install apache2
sudo sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/apache2/apache2.conf
sudo systemctl stop apache2.service && sudo systemctl start apache2.service && sudo systemctl enable apache2.service

# Install DB Server
echo 'Installation der MariaDB'
sudo apt-get install mariadb-server mariadb-client
sudo systemctl stop mariadb.service && sudo systemctl start mariadb.service && sudo systemctl enable mariadb.service

# Install PHP 7.2 And Related Modules
echo 'Installation der php Packete'
sudo apt-get install software-properties-common
sudo apt-get install php7.2 libapache2-mod-php7.2 php7.2-common libapache2-mod-php7.2 php7.2-mbstring php7.2-xmlrpc php7.2-soap php7.2-apcu php7.2-smbclient php7.2-ldap php7.2-redis php7.2-gd php7.2-xml php7.2-intl php7.2-json php7.2-imagick php7.2-mysql php7.2-cli php7.2-ldap php7.2-zip php7.2-curl

# Create php File
./nc_install_phpini_apache

# Download NextCloud Latest Release
echo 'Download Nextcloud und Entpacken nach /html'
cd /tmp && wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip
sudo mv nextcloud /var/www/html/nextcloud/

# Correct Permissions NextCloud Folder
echo 'Änderung der Rechte des Nextcloud Ornders'
sudo chown -R www-data:www-data /var/www/html/nextcloud/
sudo chmod -R 755 /var/www/html/nextcloud/

# Enable The NextCloud And Rewrite Module
sudo a2ensite nextcloud.conf
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime

# Restart Apache2
sudo systemctl restart apache2.service