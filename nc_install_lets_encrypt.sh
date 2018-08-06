# Install Let’s Encrypt Client
echo 'Install Let’s Encrypt Client'
sudo apt-get install python-certbot-apache

# Obtaining Your Free SSL/TLS Certificates
echo 'Obtaining Your Free SSL/TLS Certificates'
sudo certbot --apache -m $var_config_apache_ServerAdmin -d $var_config_apache_ServerName -d $var_config_apache_ServerAlias