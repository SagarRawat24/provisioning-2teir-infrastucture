#!/bin/bash

# Update package list
sudo apt-get update

# Install nginx
sudo apt-get install nginx -y

# Write "Hi sagar" to the index file
echo "Hi sagar" | sudo tee /var/www/html/index.nginx-debian.html

# Get the host IP address
host_ip=$(hostname -I | awk '{print $1}')

# Append the host IP address to the index file
echo "Host IP: $host_ip" | sudo tee -a /var/www/html/index.nginx-debian.html
