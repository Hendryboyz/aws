# Elastic File System

* Allow to mount on different linux instances at the same time.(EBS can be attached only one instance at the same time)
* network based multi-user file system
* Select MAX I/O if hundreds of instance would attach this EFS
* file system size will grow as users put the data in(don't need to request upfront)
* Allow to access from
  * local VPC
  * access across VPC peering
  * access across direction connection(on-premises)
* Allow to use AWS backup to backup EFS
* EFS region resilience across multiple availability zones
* EFS support two tier storage classes: Standard and Infrequent Access(IA)
  * Lifecycle management is used to move files between classes based on access patterns


## Deploy in VPC
* Create the mount target in the subnet(one in each AZ)
  * Use security group(Layer5) to control the mount target

Throughput Mode
* Busting:
  * Based 100 MiB/s
  * Earn 100 MiB/s per 1 TiB size
  * Earn 50 MiB/s per TiB storage
* Provisioned: specify the certain amount of throughput independent from the size of the file system size

## Usecase
* large scale parallel access of data
  * thousands of clients mount efs and access data concurrently
* media processing workflow
* big data analytics
* shared data between EC2 instances
