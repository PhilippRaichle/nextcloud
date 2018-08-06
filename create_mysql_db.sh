sudo mysql -u root -pJsQSQsy6faEwI*-C <<EOF
CREATE DATABASE nextcloud;
CREATE USER 'nc01admin'@'localhost' IDENTIFIED BY 'M5B9xNCD5lP7izfO';
GRANT ALL ON nextcloud.* TO 'nc01admin'@'localhost' IDENTIFIED BY 'M5B9xNCD5lP7izfO' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF