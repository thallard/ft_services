CREATE DATABASE wordpress;

create user 'wp'@'localhost' identified by 'wp';

GRANT ALL PRIVILEGES ON wordpress.* to 'wp'@'localhost';

FLUSH PRIVILEGES;