#!/bin/bash

## Public Cat
yum update -y
yum install -y httpd
yum install -y wget
chkconfig httpd on
cd /var/www/html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic4_DNSFundamentals/PrivatePublicZones/PublicCats/index.html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic4_DNSFundamentals/PrivatePublicZones/PublicCats/larry.jpg
service httpd start

## Private Cat
yum update -y
yum install -y httpd
yum install -y wget
chkconfig httpd on
cd /var/www/html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic4_DNSFundamentals/PrivatePublicZones/PrivateCats/index.html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic4_DNSFundamentals/PrivatePublicZones/PrivateCats/palmerston.jpg
service httpd start