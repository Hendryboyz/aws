#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start 
sudo usermod -a -G docker ec2-user

## logout and login again
sudo yum install git -y
git clone https://github.com/linuxacademy/content-aws-csa2019.git

cd content-aws-csa2019/lesson_files/03_compute/Topic5_Containers/Docker/
docker build -f Dockerfile -t  containercat:latest .
docker images
docker run -it -p 80:80 containercat:latest

docker login
docker images # copy the containercat <image_id>
docker tag <image_id> DOCKERHUB_USER/containercat
docker push DOCKERHUB_USER/containercat