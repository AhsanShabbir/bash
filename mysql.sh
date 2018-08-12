#!/usr/bin/env bash


Update () {
    echo "-- Updating packages --"
    sudo apt-get update
    sudo apt-get upgrade
}


echo "-- Removing existing instance of MySQL --"

sudo apt-get remove dbconfig-mysql
sudo apt-get remove --purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
sudo rm -r /etc/mysql
sudo rm -r /var/lib/mysql

echo "-- Prepare configuration for MySQL --"

wget http://dev.mysql.com/get/mysql-apt-config_0.8.1-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.1-1_all.deb

Update

sudo apt-get install mysql-server
sudo apt install php-mysql mysql-common
mysql --version

echo "-- Restarting MySQL Server --"

sudo service mysql reload


