#!/bin/bash
echo "verion1" >> version1.txt
echo "verion2" >> version2.txt
echo "verion3" >> version3.txt

aws s3 cp ./version1.txt s3://cda-henry-test-ver-2018/myfile.txt
aws s3 cp ./version2.txt s3://cda-henry-test-ver-2018/myfile.txt
aws s3 cp ./version3.txt s3://cda-henry-test-ver-2018/myfile.txt

# only latest version of objects
aws s3 ls s3://cda-henry-test-ver-2018

# list all version of the objects
aws s3api list-object-versions --bucket cda-henry-test-ver-2018

# copy the latest version of object
aws s3 cp s3://cda-henry-test-ver-2018/myfile.txt ./myfile.txt

# copy the specific version of object
aws s3api get-object --bucket cda-henry-test-ver-2018 --key myfile.txt --version-id <version_id> ./myoldfile.txt