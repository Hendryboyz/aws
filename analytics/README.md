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
> a tool for large-scale parallel processing of big data and other large data workloads.
* Apache Hadoop is delivered as a managed cluster service using EC2 instances.
* Use EMRFS to share, input and output the file in S3
* On-demand billing
* Used for large scale data, log analysis, indexing, machine learning, and many other large scale **computing** service
* Athena is only for quering the files that have already in S3

## Nodes
* master
  * split the job to other nodes
  * manage clusters
  * master fail = cluster fail
* core
  * zero or more nodes
  * manage data for HDFS
  * run jobs
  * using stable computing service
* task
  * only run tasks
  * task nodes fail, a core node starts the task on another task/core node
  * allow to use spot instances to get best economy

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
* 