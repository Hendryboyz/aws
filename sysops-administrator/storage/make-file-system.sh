#!/bin/bash

lsblk

sudo file -s /dev/nvme1n1
sudo mkfs -t xfs /dev/nvme1n1 # Nitro-Base system should use xfs file system
# sudo mkfs -t ext4 /dev/xd* # t2 instance
sudo mkdir /data
sudo mount /dev/nvme1n1 /data # mount volume to specific directory