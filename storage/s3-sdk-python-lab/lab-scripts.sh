#!/bin/bash
aws s3 mb s3://the-la-cda-henry-s3-bucket
aws s3 ls
echo 'Hello, AWS!' > ourtest.txt
aws s3 cp ./ourtest.txt s3://the-la-cda-henry-s3-bucket/ourtest.txt