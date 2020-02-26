#!/bin/bash
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -U ./amazon-cloudwatch-agent.rpm
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
# config store in /opt/aws/amazon-cloudwatch-agent/bin/config.json

# run cloud watch agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-onfig -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s