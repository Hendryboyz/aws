#!/bin/bash

# if the volume which was took snapshot is smaller than the new lanuch instance volume
# Volume from snapshot should be initialized to get full performance
lsblk # list block

## dd: initial disk 
sudo dd if=/dev/nvme1n1 of=/dev/null bs=1M
# read all the blocks seqentially
# if: input file
# of: output file
# bs: blocks

## f.i.o utility: initial disk for more feedbacks
sudo yum install -y fio
sudo fio --filename=/dev/nvme2n1 \
  --rw=read \
  --bs=128k \
  --iodepth=32 \
  --ioengine=libaio \
  --direct=1 \
  --name=volume-initialize