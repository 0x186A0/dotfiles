sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git xclip
sudo apt install curl gpg gnupg2 software-properties-common ca-certificates apt-transport-https lsb-release -y


# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

rustup override set stable
rustup update stable


mkdir ~/App/
cd ~/App/


# Alacritty

### Debs

sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

### Building

git clone https://github.com/alacritty/alacritty.git
cd alacritty

cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

### Create Desctop Entry 

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

cd ~/App/

# LED for Logitech keyboard
sudo apt-get install  -y g++ make libhidapi-dev
git clone https://github.com/MatMoul/g810-led.git
cd g810-led
make bin # for hidapi
# make bin LIB=libusb # for libusb
sudo make install


cd ~/App/

# Neovim
sudo apt-get -y install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim/
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# PHP
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt -y install php8.3
sudo apt install php8.3-{xdebug,cli,pdo,mysql,pgsql,zip,gd,mbstring,curl,xml,bcmath,common} -y
# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php
