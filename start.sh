#!/bin/bash

# Install EPEL
sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'

# Install node
echo "Installing/updating node..."
yum update -y
yum install -y nodejs npm
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
chown hacksu /var/www
chgrp hacksu /var/www
cd /var/www
[ -d Website ] && rm -rf Website
git clone https://github.com/hacksu/Website
cd Website

# Install forever
echo "Installing forever package..."
npm install -g forever
forever start app.js

echo "All done, enjoy the site!"
cd ~