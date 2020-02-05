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

# Kinesis and Kinesis Firehose
> Allow to process real time data.
* Design to injest millions of data in real time
* Different with SQS
  * In rolling windows can access all data in the Kinesis, support mulitiple consumer process the same data
  * SQS(Queue) only allow data to be processed one time
  * SQS are used for messaging. Kinesis are used for large scale real time streaming
* Billing per Shard hour

## Firehose
* Allow the data source
* Store the large scale streaming data to S3 consistently
* Perform data transformation before storing the data
* Kinesis can be the data source and attach Firehose instead the producer talk to the Firehose directly

## Terminologies
* Producer
* Consumer
* Kinesis Stream: Basic components in Kinesis
  * stream provide 24 hours rolling windows(extend to 7 dyas for external )
* Kinesis Shard(Kafka Broker): Provide the capacity to stream
   * 1 MB/secs Write per Shard
   * 2 MB/secs Read per Shard
   * 1000/secs Records per Shard  
* Kinesis Data Record(Kafka Topics): Entity writtent to and read from stream