#! /bin/bash

sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y supervisor
sudo apt-get install nginx -y
#sudo mv /tmp/nginx.conf /etc/nginx/sites-available/default
#sudo chown root:root /etc/nginx/sites-available/default
sudo snap install certbot --classic
sudo apt-get install -y openjdk-16-jdk