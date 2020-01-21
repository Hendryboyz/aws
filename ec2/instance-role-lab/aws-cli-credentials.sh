#!/bin/bash
aws sts get-caller-identity

aws config

# Clear aws credentials
export AWS_ACCESS_KEY_ID=<ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<SECRET_ACCESS_KEY>
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
rm ~/.aws/credentials