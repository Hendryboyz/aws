#!/bin/bash

# webserver 1
yum update -y
yum install -y httpd
yum install -y wget
chkconfig httpd on
cd /var/www/html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic5_AdvancedDNS/simple/web1/index.html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic5_AdvancedDNS/simple/web1/larry.jpg
service httpd start

# webserver 2
yum update -y
yum install -y httpd
yum install -y wget
chkconfig httpd on
cd /var/www/html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic5_AdvancedDNS/simple/web2/index.html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic5_AdvancedDNS/simple/web2/larry.jpg
service httpd start

# webserver 3
yum update -y
yum install -y httpd
yum install -y wget
chkconfig httpd on
cd /var/www/html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic5_AdvancedDNS/simple/web3/index.html
wget https://raw.githubusercontent.com/linuxacademy/content-aws-csa2019/master/lesson_files/04_networking/Topic5_AdvancedDNS/simple/web3/larry.jpg
service httpd start
