#!/bin/bash

# Update and upgrade system packages
sudo apt update -y
sudo apt upgrade -y

# Install Node.js and npm
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Install Yarn
sudo npm install -g yarn -y

sudo npm install -g ts-node typescript

# Install Git
sudo apt install -y git

# Install PM2 globally
sudo npm install -g pm2 --silent

# Install Nginx
sudo apt install -y nginx

# Remove the default Nginx configuration
sudo rm /etc/nginx/sites-available/default

# Create a new default Nginx configuration
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

# Restart Nginx
sudo systemctl restart nginx

# Install Certbot and the Nginx plugin
sudo apt install -y certbot python3-certbot-nginx

# Set up automatic renewal
echo "0 12 * * * root certbot renew > /var/log/letsencrypt/renew.log" | sudo tee -a /etc/crontab > /dev/null

sudo touch /home/ubuntu/hello.txt

