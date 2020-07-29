#!/bin/bash
lsblk # describe current storage status
df -h

# t2 instance
sudo file -s /dev/xvd* # describe the file system
sudo growpart /dev/xvda 1
# expand ext2, ext3 or ext4 file system
sudo resize2fs /dev/xvda
sudo xfs_growfs -d /

# Nitro-Based(t3) instance
# look at the partition table
sudo file -s /dev/nvme?n*
# extend partition xfs file system
sudo growpart /dev/nvme0n1 1
# expand xfs file system
sudo xfs_growfs -d /