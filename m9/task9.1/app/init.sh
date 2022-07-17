#!/bin/bash
my_private_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
my_public_ip=`curl icanhazip.com`
chmod 777 /var/www/html/index.html
echo "<h2 style=\"color: blue;\"> WebServer with  private IP: $my_private_ip</h2><br><h2>and server public IP: $my_public_ip</h2><br>Build by Docker and Terraform!" > /var/www/html/index.html
chmod 755 /var/www/html/index.html
apachectl -D FOREGROUND