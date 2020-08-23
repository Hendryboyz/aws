# DynamoDB
> Two dimension key(partition and sort keys) value NoSQL database. 

* Don't define table schema upfront
* Each table have to provide a unique primary key. Primary key can be **a partition key** or **parition key consist with sort key**.
* Regional base service
* Table name have to be unique in the account and in the region
* Item in the table don't have to given the same attributes
* Private by default. Users have to access DynamoDB througth the policies which give external identies permissions.
* Resilient on regional basis. Store at least 3 replicas in different AZs.
* Dynamodb have some initial burst capacity and it will be kept for users

## Feature
* Schemaless, key-value store
* DynamoDB stream - allows for other services to take action based on **changes to dynamodb items**

## Terminologies
* Table -> Table: a collection of items that share the same partition key and/or sort key in DynamoDB.
* Items -> Rows
* Attributes -> Columns
  * Allow nested attributes
* Range Key = Sort Key
* Hash Key = Partition Key

## Tables
### Primary Key
* Partition(Hash) Key: table use partition key in an internal hash function to determine where  the partition data willl be stored
* Sort(Range) Key: partition use sort key to sort the data inside of that partition
* Primary key is used to identify item uniquely.
  * Simple Primary Key: Only Hash Key
  * Composite Primary Key: Hash Key + Range Key

## Operations
* Item size max 400kb
* Item only can be handle with the entired item. It isn't allow to handle the partial of item.

### GetItem 
> effenciently read a **single item** from a table by providing the **item's primary key**

### BatchGetItem
> read up to 100 items, from one or more tables
  - equal to execute get item operation multiple times

### Scan
* Read **all** of the items in a table. It's very ineffeciency.
* To scan a table, don't require to provide anything as the parameters.
* Read every item in the table, apply the filter to throw the item which don't match away, and then deliver the remaining one as the reslt.
* Consume the read capacity for the entire table(expensive)
* **Always avoid** to use scan to read items
* Flexible

### Query
* Lookup the table without reading every items(cheaper)
* More efficiency than a Scan
* Query results are always sorted by the Sort Key, and sorted in ascending order
  * Set ScanIndexForward parameter to false to reverse the order - queries only
* Return items are treated as a **single read operation**, where DynamoDB computes the total size of all items and then rounds up to the next 4KB boundary
* Retrieve the item with the specific partition key and sort key
* Don't allow to query data cross partition key
* Users have to know how they query the table
* Always be **recommended**

## Error Handling
### Exponential backoff algorithm
> Apply progressively longer waits between retries for consecutive error responses
* AWS SDK is using the exponential backoff algorithem to handle all API call including DynamoDB
* Users have to handle the exponential backoff retries by themselves if they don't leverage the AWS SDK

### ProvisionedThroughputExceededException
> Application is sending more requests to the DynamoDB table than the provisioned read/write capacity can handle

## Security
* Site-to-site VPN
* Direct Connect(DX)
* Fined-grained access allow to limit the users to take some items or attributes
* IAM policies and roles
* CloudWatch and Cloud Trails
* VPC Endpoints

### Encryption
* Allow to use default(AWS Owned) or KMS managed Customer Master Key

## Advanced Configurations
### Backups & Restore
* Full backups at anytime
* Zero impact on table performance or available
* Consist within seconds and **retained until deleted**
* Operate with the same region as the source table
* Allow to create backup manually(Backup index and configurations)
* Restore will create a new table
  * Restore will cover the index and configuration

**Point-in-time Recovery(PITR)**
* Protect against accidental writes or deletes
* Allow to restore to anytime up to last **35days**
* Increment backups
* Not enable by default
* Last restorable: **5 minutes** in the past

### Metrics and Monitoring
* Full integration with CloudWatch

### Time to Live(TTL)
* Define an expiry time for data
* Expired data marked for deletion and it will be deleted in next 48 hours
* Great for removing irrelevant or old data
  * Session data
  * Event logs
  * Temporary data
* Reduces cost by automatically removing data which is no longer relevent
* Enable TTL in the Tables/[tables_name]/Items/Actions/Manage TTL to define the TTL attribute

## Usecase
* NoSQL Database
* Unstructured Data
* Database as a service(Serverless)
* Don't require to provide a upfront schenma

## DynamoDB Transactions
* Multiple one-or-nothing operations
* Two underlying reads or writes - prepare/commit
* Work up to 25 items or 4 MB of data at anytime

## Architectures

### Partition
> Use the partition to deliver the DynamoDB server entity. DynamoDB use partition key to manage data and provide the scalibility.

* Table start off with a single partition
* Scale partition depends on data and required capacity
* Query centralize the capacities to a single **partition**, it's more efficiency
* Provisioned capacity is for partition not table
* Partitions are copied to 3 different AZs. Copied are stored in node.
* Partition have one leader node and another none leader nodes.
* Strongly consistent retrieve data from leader node and the data in the leader node are always up to date
* Eventually consistent allow to read data from any of the nodes(leader or non-leader). Maybe non-leader still doesn't update the new data. [Defaut, Cheaper]

### Capacities

#### On-demand mode
the capacities are hard to forecaset. Bills a per-request charge.
* Only allow to change between on-demand and provisioned **once per day**
* Bills a per-request charge.
* Balance cost and performance
* **Pay more per request** than with provisioned capacity
  * only suitable for new launching application that users have no idea about the required capacities


#### Autoscaling
* Auto-scaling modes steps
  1. Create autoscaling policy(target utilization) for dynamodb table
  2. Publish cosume capacity metrics to CloudWatch
  3. CloudWatch use Alarm invoke application auto scaling to evaluate scaling policy
  4. Application auto scaling issue UpdateTable request to adjust table's provisioned throughput
* Provisioned throughtput mode:
  * A read operation will consume one capacity for every 4 KBs of strong consistent data or 0.5 capacity for every 4 KBs of eventual consistent data.
  * Read any data less than 4 kb in a single operation, it will always consume 0.5 for eventual and 1 for strong consistent data.
  * Write also cost 1 capacity to write 1 kbs of data. Write don't have consistent mode.
* Auto scaling sometimes scale too slow and there are some latencis between DynamoDB and CloudWatch
* The capacity of each operation is calculated seperately
* Allow to auto scaling capacities in DynamoDB settings
* Can predict some level of workload
* Allow to control maximum provisioned capacity(cost sensitive)

### Throttling
* Each partition share the table's RCUs and WCUs. The capacity of the partition determine if the request is allowed or will be throttled (rejected)
* Prevent application use too much capacity to save users' money
* Cause
  - Always Read/Write to hot partition(partition key)
  - Table don't have enough capacity
* Result
  - Lose data
  - Data outdated
  - Slow processing
* Solution
  - Increase provisioned capacity on the table
  - Be aware of the capacity of GSIs. Throttle on an index is double-counted as a throttle
  - How often application retry when throttling occurs(progrssively longer waits)
  - Design partition key to distribute the read/write operation as evenly as possible
* Allow to use Time-to-Live to expire some unused items


**Write Capacity Unit(WCU)**
* One write capacity unit allows to write 1 KB to the table

**Read Capacity Unit(RCU)**
* One read capacity unit allows to read 4 KBs per second from the table for **strong consistency**
* One read capacity unit allows to read 2 * 4 KBs per second from the table for **eventual consistency**

### Reference
* [How to Calculate Read and Write Capacity for DynamoDB](https://www2.linuxacademy.com/howtoguides/20310-how-to-calculate-read-and-write-capacity-for-dynamodb/)

## Database Migration Service(DMS)
>  A cloud service that makes it easy to migrate relational databases, data warehouses, No SQL databases and other types of data stores. Users can use AWS DMS to migrate data intor the AWS cloud, between on-premises instances(througth an AWS cloud setup) or between combinations of cloud and on-premises setups
* Support **homogenous** migrations
  * Oracle => Oracle
  * Schema Conversion Tool is NOT required to identical databases!
* Support **heterogeneous** migrations
  * SQL Server => Amazon Aurora
  * AWS Schema Conversion Tool(SCT) required
* Configure all of your data transformation logic inside DMS to perform migrations automatically
* Source database allow to remain operational during the migrations
* DynamoDB is not supported as a source database, but allow to use DynamoDB as a destination database

### Source
* On-premises and EC2 instances databases: Oracle, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL, SAP, MongoDB, DB2
* Azure SQ 
* Amazon S3
* Amazon RDS(including Aurora)

### Target
* On-premises and EC2 instances databases: Oracle, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL, SAP
* RDS
* Redshift
* DynamoDB
* S3
* **Elasticsearch** service
* Kinesis Data Streams
* Document DB

## DynamoDB streams
> Time ordered sequence of item level change in DynamoDB table(insert, update, delete)

* Like a trigger in Relational Database and this trigger is Lambda function in DynamoDB(Event Driven)
* Per table basis
* Provides a rolling **24 hours** window of any changes to items in the table
  * stream records are group into shard and shard contain the information for accessing and iterating through these records
  * stream records within shard are removed automatically within **24 hours**
* Default **NO** streams
* Allow the changes to trigger the Lambda function. Use DynamoDB provide the resilient and Lambda provide the scalibility.
  * Combine with Lambda function  for functionality liked stored procedures like RDBMS
* DyanmoDB streams seperate the endpoints from DynamoDB
* Accessed using a dedicated endpoint
* As an event source for Lambda allow to create applications which take actions based on events in the dynamodb table

### Usecase
* Use DynamoDB streams to implement the transaction in one or more DynamoDB table in **24 hours** windows

### Types
* KEYS_ONLY: items are added, updated or deleted. The primary key will be added
* NEW_IMAGE: entired new item will be added
* OLD_IMAGE: entired pre-change item will be added
* NEW_AND_OLD_IMAGES: entired item before and after chaning will be added

### Glabol table
> Managed Multi-master, Multi-regioned Replication
* Default operate in the single region
* Steps
  1. Enable streams
  2. Add additional region to replica table
* All tables in the different regions allow to read operation and write operation
  * Last write to the same item will override the previous results
* Only allow an **empty table** to enable global table
* Based on **Dynamodb Streams**
* Multi-region redundancy for DR or HA
* No application writes
* Replication latency under **one second**