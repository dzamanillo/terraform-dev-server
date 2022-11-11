#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo service nginx start
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo snap install certbot --classic
# sudo apt-get dist-upgrade -y
sudo npm install pm2 -g