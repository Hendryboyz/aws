#!/bin/bash

yum update -y
git clone https://github.com/linuxacademy/cda-2018-flask-app
cd cda-2018-flask-app/
python3.6 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install awsebcli
eb init
aws ec2 create-default-vpc
aws ec2 create-default-subnet --availability-zone us-east-1a
eb create
