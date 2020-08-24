# Athena
* query huge data which are stored on S3 with no preparation(schema less)
* only pay for data volume queried by the service
* NO data is modified by athena, and output can be sent to visualization tools
* schema-on-read: define the schema in advanced to structure the data in s3
  * like the view of the data
* allow query through the schema-on-read tables
* serverless, so only be billed for data scan
* Athena can integrate with AWS Glue

## Usecase
* Query CloudTrail, CloudFront, CloudWatch, Load Balancer logs or VPC Flow Logs
* Only the data users queried during the operation

# Elastic MapReduce
> a tool for large-scale parallel processing of big data and other large data workloads. With EMR, users can run petabyte-scale analysis at **less than half the cost of traditional on-premises solutions** and over 3 times faster than standard Apache Spark
* **Big data processing** solution hosted on AWS
* Apache Hadoop is delivered as a managed cluster service using EC2 instances.
* Use EMRFS to share, input and output the file in S3
* On-demand billing
* Used for large scale data, log analysis, indexing, machine learning, and many other large scale **computing** service
* Athena is only for quering the files that have already in S3

## Nodes in the Cluster
* master
  * split the job to other nodes
  * manage clusters
  * master fail = cluster fail
  * track the **status of tasks**
  * monitor the health of the cluster
  * every cluster has a master node
* core
  * zero or more nodes
  * manage data for HDFS
  * run jobs(tasks) and stores data
  * using stable computing service
  * multinode cluster must have at least one node
* task
  * only run tasks, **DOES NOT** store data in HDFS
  * task nodes fail, a core node starts the task on another task/core node
  * allow to use spot instances to get best economy
  * task nodes are **optional**

## High Availability
* Persist logs in master node: archive the log files stored on the master node to Amazon S3 periodically
  * 5-minutes intervals
  * only allow to setup while creating the cluster for the first time

## Analytics
* Run SQL query of that data as it existing in firehose or stream
* Allow to store the query result to S3, Redshift and Elasticsearch Cluster

# Redshift
* Peta-bytes scale data warehousing solution from AWS.
* Full-managed and scalable
* Data warehousing and analytics
* Generally, the data store after transactions have been process in the stores
* Row-base database: for online transation process database
* Column-base database: for anaytics purpose database
* Database you would add and updagte individual records


* Athena: Perform transactional queries on data in the S3
* EMR: Large scale analytics and modified data

## Architecture
A cluster is a set of nodes that consists of :
 - leader node: only one
 - compute nodes: a lot of compute nodes
### Leader Node
* Receive query from client application 

### Compute Node

