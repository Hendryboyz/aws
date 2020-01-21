#!/bin/bash
aws iam create-role --role-name DEV_ROLE  --assume-role-policy-document file://trust_policy_ec2.json
aws iam create-policy --policy-name DevS3ReadAccess --policy-document file://dev_s3_read_access.json
aws iam attach-role-policy --role-name DEV_ROLE --policy-arn "<DevS3ReadAccess_arn>"
aws iam create-instance-profile --instance-profile-name DEV_PROFILE
aws iam attach-role-to-instance-profile --instance-profile-name DEV_PROFILE --role-name DEV_ROLE

## Attach to ec2
aws ec2 associate-iam-instance-profile --instance-id <WEB_SERVER_INSTANCE_ID> --iam-instance-profile NAME="DEV_PROFILE"

# Verify settings
aws iam list-attached-role-policies --role-name DEV_ROLE
aws iam get-policy --policy-arn "<DevS3ReadAccess_arn>"
aws iam get-policy-version --policy-arn "<DevS3ReadAccess_arn>" --version-id "v1"
aws iam get-instance-profile --instance-profile-name DEV_PROFILE
aws ec2 describe-instances --instance-ids <WEB_SERVER_INSTANCE_ID>