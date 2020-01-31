# DynamoDB
> Two dimension key(partition and sort keys) value NoSQL database. 

* Don't define table schema upfront
* Each table have to provide a unique primary key. Primary key can be **a partition key** or **parition key consist with sort key**.
* Regional base service
* Table name have to be unique in the account and in the region
* Item in the table don't have to given the same attributes
* Private by default. Users have to access DynamoDB througth the policies which give external identies permissions.
* Resilient on regional basis. Store at least 3 replicas in different AZs.

## Terminologies
* Table -> Table: a collection of items that share the same partition key and/or sort key in DynamoDB.
* Items -> Rows
* Attributes -> Columns
  * Allow nested attributes
* Range Key = Sort Key
* Hash Key = Partition Key

## Operations
* Item size max 400kb
* Item only can be handle with the entired item. It isn't allow to handle the partial of item.

### Scan
* To scan a table, don't require to provide anything as the parameters.
* Read every item in the table, apply the filter to throw the item which don't match away, and then deliver the remaining one as the reslt.
* Consume the read capacity for the entire table(expensive)
* Flexible

### Query
* Lookup the table without reading every items(cheaper)
* More efficiency
* Retrieve the item with the specific partition key and sort key
* Don't allow to query data cross partition key
* Users have to know how they query the table
* Always be **recommended**

## Advanced Configurations
### Backups
* Point-in-time Recovery: Allow to restore to anytime up to last **35days**
* Allow to create backup manually(Backup index and configurations)
* Restore will create a new table
  * Restore will cover the index and configuration

### Encryption
* Allow to use default(AWS Owned) or KMS managed Customer Master Key

### Glabol table
* Default operate in the single region
* Steps
  1. Enable streams
  2. Add additional region to replica table
* All tables in the different regions allow to read operation and write operation
  * Last write to the same item will override the previous results
* Only allow an **empty table** to enable global table

### Metrics and Monitoring
* Full integration with CloudWatch

## Usecase
* NoSQL Database
* Unstructured Data
* Database as a service(Serverless)
* Don't require to provide a upfront schenma

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
* On-demand mode: the capacities are hard to forecaset. Bills a per-request charge.
* Provisioned throughtput mode:
  * A read operation will consume one capacity for every 4 KBs of strong consistent data or 0.5 capacity for every 4 KBs of eventual consistent data.
  * Read any data less than 4 kb in a single operation, it will always consume 0.5 for eventual and 1 for strong consistent data.
  * Write also cost 1 capacity to write 1 kbs of data. Write don't have consistent mode.
* The capacity of each operation is calculated seperately
* Allow to auto scaling capacities in DynamoDB settings

**Write Capacity Unit(WCU)**
* One write capacity unit allows to write 1 KB to the table

**Read Capacity Unit(RCU)**
* One read capacity unit allows to read 4 KBs from the table for **strong consistency**
* One read capacity unit allows to read 2 * 4 KBs from the table for **eventual consistency**

### Reference
* [How to Calculate Read and Write Capacity for DynamoDB](https://www2.linuxacademy.com/howtoguides/20310-how-to-calculate-read-and-write-capacity-for-dynamodb/)

## DynamoDB streams
* Per table basis
* Provides a rolling 24 hours window of any changes to items in the table
* Default no streams
* Allow the changes to trigger the Lambda function. Use DynamoDB provide the resilient and Lambda provide the scalibility.

### Types
* KEYS_ONLY: items are added, updated or deleted. The primary key will be added
* NEW_IMAGE: entired new item will be added
* OLD_IMAGE: entired pre-change item will be added
* NEW_AND_OLD_IMAGES: entired item before and after chaning will be added

## DynamoDB Index
Users should know the access pattern of the table in advanced. But users can change the access pattern through the index.

### Local Secondary Index(LSI)
> Alternative view of a table's data using **the same partition key** but alternative sort key. Allow us to specify the alternative sort key.

* Share the RCUs and WCUs values for the main table.
* Only allow to be created at the same time as creating a table
* Only work when table has a composite primary key(hash key + range key)
* Per table allow to have maximum 5 LSIs


### Global Secondary Index(GSI)
> Global Secondary Index allow data in a table to be presented using an alternative partition and sort key.

* Like using the new partition and sort key create a new table
* Allow to be created at any point after the table is created
* GSIs have their won RCU and WCU values, and allow to auto scaling
* Allow to create 20 GSIs per table. Can be increased by support tickets.
* Asynchonous copied the data from the main table, have some leg. GSIs doesn't allow to perform strongly consistent reads

### Proejction
> Can use to improve read performance by projecting less data, but if you take the non-projected attributes, it will cause huge performance penalty because it have fetch attributes from the main table.

* All
* Keys only
* Include: only take small amount of data to the index