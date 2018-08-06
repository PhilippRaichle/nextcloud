# Creat php file
echo 'Anlegen der php.ini Datei'
cat > /etc/php/7.1/apache2/php.ini <<EOF
file_uploads = On
allow_url_fopen = On
memory_limit = 256M
upload_max_filesize = 100M
display_errors = Off
date.timezone = Europe/Berlin
EOF