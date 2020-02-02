#!/bin/bash

sudo yum install -y amazon-efs-utils
df -k
sudo mkdir /mnt/efs
#sudo mount -t efs fs-90f33c10:/ /mnt/efs
sudo mount -t efs <efs-id>:/ /mnt/efs
sudo touch /mnt/efs/test.txt
sudo vim /mnt/efs/test.txt