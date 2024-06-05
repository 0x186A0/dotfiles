sudo apt update
sudo apt upgrade -y
sudo apt install -y git software-properties-common

sudo add-apt-repository -y ppa:ondrej/php

# PHP install

sudo apt install -y php8.3
sudo apt install -y php8.3-{xdebug,cli,pdo,mysql,pgsql,zip,gd,mbstring,curl,xml,bcmath,common}