# Erstellung der apache NC Datei

# Variablen
. ./nc_install_variables.sh

# Datei Erstellung
echo 'Erstellung der Nextcloud Apache Datei'
cat > /etc/apache2/sites-available/nextcloud.conf <<EOF
<VirtualHost *:80>
     ServerAdmin $var_config_apache_ServerAdmin
     DocumentRoot /var/www/html/nextcloud/
     ServerName $var_config_apache_ServerName
     ServerAlias $var_config_apache_ServerAlias
  
     Alias /nextcloud "/var/www/html/nextcloud/"

     <Directory /var/www/html/nextcloud/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
          <IfModule mod_dav.c>
            Dav off
          </IfModule>
        SetEnv HOME /var/www/html/nextcloud
        SetEnv HTTP_HOME /var/www/html/nextcloud
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF