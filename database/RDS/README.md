# RDS
> Database as a service product which can let users reduce the overhead management problems.

## Properties
* manage backup and provide resilience(multi-az deployment)
* read replica to improve read performance

## Database Engine
* MySQL, MariaDB
* PostgreSQL
* Oracle
* MSSQL  

Note: Aurora - AWS in-houes developed database engine

## DB Subnet Group
* the deployment subnet for the RDS
* must be created before initializing any RDS instance

## DB instance size
Support types
* General Classes: P
* Memory Optimization Type: R, X
* Burstable Classes: T

## Strorage Type
* Use elastic block storage type: gp2(3IOPS/GB, MAX 3000), io1(1000-80000)
* Billing allocated storage not using storage

## Billing
* Instance Type/Size
* Provisioned Storage Size(not used)
* IOPS(for io1)
* Data transferred out
* Backups/snapshots beyond the 100% that is free with each DB instance

## Connectivity
* Public access means RDS will be provided a public IP address
* Availability zone option is based on the subnet group

## Backup and Restore
### Database Backup
* Manual snapshot has no automatic retention. Existing even after database deleted.
  * Manual snapshot can be copied to different region
  * Have to specify the new KMS(regional service) master key if encrypt enable
* Automatic backup retention Day from 0 ~ 35 days
* Automatic Backup occur once per day and have retention time(Max. 35 days)
* Point in time back occur to S3 every 5 minutes.
* If there is a standby db, all backup will be taken from standby instance to reduce the impact of primary dataase.
* Snapshot is stored to the S3

### Database restore
* Restored database will have a brand new CNAME

## Multi-AZ deployment and Read Replica
### Multi-AZ
* Synchronous replica between standby and primary
* Run in different AZs
* CNAME failover to standby automatically
* Using anything except Aurora. Users can't access to standby instance beyond the resilience/failover.
* Standby will be the backup and replica target
* CNAME change will cause some interruption, it minimize the impact.
* Multi-AZ increase Recovery Time Objects

### Read Replica
* Read only copy and it can be in the same or different region
* Also can deploy to Multi-AZs
* Copied to read replica **asynchronously**(a little lag existing)
* Master instance have to **enable automatic backups first**
* Faster promot read replica to future master(globally resilience)
* Independent addressable(indenpendent DNS) but only for reading
* Read replica is the scale out machenism(horizontal scale)
* Single instance allow to have max 5 read replicas

### Reference
* [Multi-AZ Deployments](https://aws.amazon.com/rds/details/multi-az/)

## Note
* Read replica, or a database standby, needs to be in the same encrypted or unencrypted state as the primary database
* Only enable encryption for an Amazon RDS DB instance creation
* Encryption can't be removed
* Snapshot can be encrypted
* Allow to copy encrypted databases between Regions, but users have assign the new KMS key(KMS is regional service).