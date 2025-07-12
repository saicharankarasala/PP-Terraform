#!/bin/bash
# EC2 User Data Script to Host Static Version of venkatasaicharan.com

# Update and install Apache and wget
sudo yum update -y
sudo yum install -y httpd wget

# Enable and start Apache service
sudo systemctl enable httpd
sudo systemctl start httpd

# Clean default web directory
sudo rm -rf /var/www/html/*

# Create directory if it doesn't exist
sudo mkdir -p /var/www/html

# Download a static snapshot of your portfolio from Vercel
sudo wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://venkatasaicharan.com -P /var/www/html

# Move the contents to the root of Apache's web directory
sudo cp -r /var/www/html/venkatasaicharan.com/* /var/www/html/

# Set proper permissions
sudo chown -R apache:apache /var/www/html