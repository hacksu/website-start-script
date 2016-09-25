#!/bin/bash

# Install EPEL
sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'

# Install node
echo "Installing/updating node..."
yum update -y
yum install -y nodejs npm
yum install -y mongodb mongodb-server
npm install -g n
n stable

# Install nginx
echo "Installing nginx..."
yum install nginx

# Setup proxy
echo "Setting up the proxy..."
cp hacksu.conf /etc/nginx/conf.d/

# Start nginx
echo "Starting nginx..."
sudo service nginx start

# Clone the app
echo "Cloning the app from github..."
mkdir -p /var/www
chown -R hacksu /var/www
chgrp -R hacksu /var/www
cd /var/www
[ -d Website ] && rm -rf Website
git clone https://github.com/hacksu/Website
cd Website
chown .
cp config-example.js config.js
echo "Remember to set mailing list password in config.js"
npm install

# Install forever
echo "Installing forever package..."
npm install -g forever

echo "All done, enjoy the site!"
echo "forever start app.js"
echo "Run after setting password in config.js"
