# Kinesis and Kinesis Firehose
> Allow to process real time data. A platform on AWS to send the streaming data. Kinesis makes it easy to load and analyze streaming data, and also prviding the ablility for you to build your own custom application for the business needs
* Streaming data is data that is generated continuously by thousands of data sources, which typically send in the data records simultaneously, and in smalle sizes
* Design to injest millions of data in real time
* Different with SQS
  * In rolling windows can access all data in the Kinesis, support mulitiple consumer process the same data
  * SQS(Queue) only allow data to be processed one time
  * SQS are used for messaging. Kinesis are used for large scale real time streaming
* Billing per Shard hour

## Stream Terminologies
* Producer
* Consumer
* Kinesis Stream: Basic components in Kinesis
  * stream provide 24 hours rolling windows(extend to 7 days for external)
* Kinesis Shard(Kafka Broker): Provide the capacity to stream
   * 1000/secs Records per Shard for write, 1 MB/secs Write per Shard
   * 5 transactions per seconds for read, 2 MB/secs Read per Shard
* Kinesis Data Record(Kafka Topics): Entity writtent to and read from stream

## Firehose
* Shard, stream is completely automatic
* Allow the data source
* Store the large scale streaming data to S3 consistently
  * allow redshift retreive streaming data from stream
* Perform data transformation before storing the data
* Kinesis can be the data source and attach Firehose instead the producer talk to the Firehose directly
* Allow to send data to Elasticsearch Cluster

## Kinesis Client Library(KCL)
> the liberary is used to develop the consumer of Kinesis stream. KCL creates a **record processor** to handle the shard data
* \# of instances doesn't exceed the number of shards
* **Never** need multiple instances to handle the processing load of one shard
* one client instance can process multiple shards
* the instance installed the client library will spread the consuming workload(handle load balancing between consumers) automatically
* Resharding(like repartition in Kafka) don't need to add more instances
* CPU utilisation is the pointer to determine how many instances to launch
* Use auto scaling group and base scaling decision on CPU load on the consumers