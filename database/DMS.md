# Database Migration Service
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

## Source
* On-premises and EC2 instances databases: Oracle, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL, SAP, MongoDB, DB2
* Azure SQ 
* Amazon S3
* Amazon RDS(including Aurora)

## Target
* On-premises and EC2 instances databases: Oracle, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL, SAP
* RDS
* Redshift
* DynamoDB
* S3
* **Elasticsearch** service
* Kinesis Data Streams
* Document DB