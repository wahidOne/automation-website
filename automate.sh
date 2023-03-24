#!/bin/bash

# Install Dependencies
echo "#######################"
echo " Installing Packages..."
echo "#######################"
sudo yum install httpd wget unzip -y
echo

# Start & Enable System
echo "#######################"
echo " Start System.........."
echo "#######################"
sudo systemctl start httpd
sudo systemctl enable httpd

# Creating Tmp Directory
echo "#######################"
echo " Creating Directory...."
echo "#######################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip
unzip -o 2119_gymso_fitness.zip
sudo cp -r 2119_gymso_fitness/* /var/www/html/

# Bounce Service
echo "############################"
echo " Restarting HTTPD Service..."
echo "############################"
systemctl restart httpd
echo

# Clean Up
echo "############################"
echo " Removing Temp Directory...."
echo "############################"
rm -rf /tmp/webfiles
echo
