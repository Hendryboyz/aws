# Aurora

## Features
* Compatible with MySQL and PostgreSQL
* Cluster
* Create cluster share storage
  * Not use Multi-AZ deployment like other RDS database engine
  * MAX 64TB, 6 replica, 3 AZs
* Self-healing
* Deploy multi-AZ much more quickly
  * New reader and point to cluster shared storage, don't create new storage
* Maximum can allow 15 replicas(readers) in cluster
* Primary(writer) node write to all of the cluster shared storages
* Reader can imporve the read performance and provide the availability
  * Allow to failover to read node and read node will be promoted to the primary node
* only bill for consumed data not provisioned
* Reads and writes use the **cluster endpoint**
* Reads can use the cluster reader endpoint, which balances(load balance) connections over all reader instance

## Backtrack
Allow user to roll the database back into a previus state
* Don't require a new Aurora cluster or instance
* Other database engine only allow to restore and don't support backtrack
* Backtrack will cause entire cluster taken offline because it's actually rolling back the cluter shared storage

## Parallel Queries
* When instance creation
* Only support certain edition and certain version of Aurora
* Allow query executed across all nodes in an Aurora cluster at the same time

### Reference
* [Working with Parallel Query for Amazon Aurora MySQL](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-mysql-parallel-query.html)

## Global Databases
* Only support certain edition and certain version of Aurora
* When instance cluster creation
* Only support certain version of Aurora
* Consist of one primary AWS region master aurora data and another secondary region. Aurora will replicate data to the secondary AWS region.
* Write always happen in **primary Aurora region**
* Support global level of resilience
* Only allow memory optimized instance type
* Allow to add secondary region after primary region created

## Aurora Serverless
> On demand auto scaling configuration for Amazon Aurora deliverd as a service
* Aurora Capacity Units(ACUs)
* Only end to end, don't handle database instance
* Aurora Serverless incurs **charges per second when resources are used**. If an instance is in a paused state, then it does **not** incur a charge. You are charged for storage however.
* Use Proxy Fleet to send the request from application to Aurora Serverless Cluster. Proxies will expand or shrink by the usages.
* Serverless Capacity can be paused after certain of time inactivity
  * Pausing can reduce some cost and it have to take some time to wake up the paused capacity
* Failover is slower than the provisioned cluster
* Not allow to access Aurora Cluster via the VPN or an inter-region VPC peering
* Support Data API and Query editor

### Use Case
* Have the scale requirement at the certain of time
* Like auto scaling group

### Reference
* [Setting the Capacity of an Aurora Serverless DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.setting-capacity.html)
