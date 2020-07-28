
#!/bin/bash

aws lambda update-function-configuration --function-name my-function \
  --vpc-config SubnetIds=subtnet-1122aabb, SecurityGroupIds=sg-51530314

# Lambda uses the VPC information to set up ENIs using an IP from the private subnet CIDR range
# the role attach to lambda must have the permission
#  1. ec2:CreateNetworkInterface 
#  2. ec2:DescribeNetworkInterfaces
#  3. ec2:DeleteNetworkInterface