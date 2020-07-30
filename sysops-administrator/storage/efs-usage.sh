#!/bin/bash

# install apache server
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start

# mount efs file system
sudo yum install -y amazon-efs-utils
# the security group of EFS have to allow the inbound traffic from the security group of EC2 instance
sudo mount -t efs -o tls,iam fs-14465897:/ /var/www/html

df -T # print all file system type