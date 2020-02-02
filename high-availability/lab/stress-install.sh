#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo yum install -y stress

stress --cpu 2 --timeout 300