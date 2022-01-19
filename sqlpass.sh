#!/bin/bash

## DESCRIPTION: 

## AUTHOR: CHITRABALAN M (mchitrabalan@gmail.com)

sudo pkill -9 mysqld*
sudo pkill -9 sql*
echo "Enter the Password to Be changed"
read -p "Password : " PASS
sudo rm ~/SQL/*
mkdir ~/SQL && cd ~/SQL
sleep 2
sudo mkdir -p /var/run/mysqld
sleep 2
sudo chown mysql:mysql /var/run/mysqld
sleep 2
sudo pkill -9 mysqld*
sudo pkill -9 sql*
touch ~/SQL/db.sql
sleep 2
echo "use mysql ; FLUSH PRIVILEGES ;ALTER USER 'root'@'localhost' IDENTIFIED BY '"$PASS"';" > ~/SQL/db.sql
sleep 2
gnome-terminal -x sh -c "sudo mysqld_safe --skip-grant-tables &"
#sudo mysqld_safe --skip-grant-tables &
sleep 4
sudo systemctl start mysql.service
#sudo systemctl start mysql.service
sleep 4
sudo mysql -u root < ~/SQL/db.sql

