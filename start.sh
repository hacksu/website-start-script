#!/bin/bash

# Install node
echo "Installing/updating node..."
yum update -y
yum install -y git nodejs npm
npm install -g n
n stable

# Add a web user
echo "Creating a web user..."
useradd -mrU web

# Clone the app
echo "Cloning the app from github..."
mkdir /var/www
chown web /var/www
chgrp web /var/www
cd /var/www
su web
rm -rf Website
git clone https://github.com/hacksu/Website

# Install forever
echo "Installing forever package..."
npm install -g forever
cd Website
forever start app.js

# Install nginx
echo "Installing nginx..."
yum install nginx

# Setup proxy
echo "Setting up the proxy..."
cp hacksu.conf /etc/nginx/conf.d/

# Start nginx
echo "Starting nginx..."
sudo service nginx start

echo "All done, enjoy the site!"
