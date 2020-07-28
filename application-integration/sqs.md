# Simple Queue Service
* Long pull is more efficent than short pull
* Allow for the creation of dstributed/decoupled application components
* Consuming the message only cause messages are hidden. Message have to be deleted manually or over the retention period.
* Delete message: send the **receipt handle** of the message back to sqs to delete message
* **Polling** message between servers

## Components
### Producers
> any application, service or other components that produce SQS messages and send them to an SQS queue
* application on an EC2 instance
* AWS Lambda functions
* ECS services
* External AWS or non-AWS applications configured to send messages to SQS

### Consumers
* Responsible for deleting message from a queue
* Message doesn't be deleted automatically in the message retention period

### Queue
#### Standard Queues
> any application, service or other components that processes SQS messages
* **At least one** and  **best effort ordering** deliver each message
* For the application that can tolerate duplicate message
* Support 120000 in-flight messages

### First-In-First-Out(FIFO) Queues
* Only support multiple consumers through the use of Group IDs:
  - Group IDs can be used to interleave multiple ordered message groups within a single FIFO queue
  - Message are proceessed in order with respect to the group but not always with respect to other groups
  - Message order is only gurantee in the same group
* Garuntee that messages are sent and processed in order

## Polling Method
### Short Polling
* **DEFAULT** method of retrieving data from queue
* Occur if WaitTimeSeconds attribute is set to 0 for either queue or the specific message when using ReceiveMessage API
* the WaitTimeSeconds assign to message will override the WaitTimeSeconds of queue

### Long Polling
* Only occure when queue or the message have a **WaitTimeSeconds**
* **CHEAPER** because application makes fewer requests and connection
* Allow consumers to wait for messages to become available in the queue
* Limit 1 ~ 20 seconds

## Message
### Characteristics and limitation
* 256KB of text
* Contain up to 10 metadata attributes
* XML, json or unformatted text
* Retain up to 14 days as little as 1 minute
* invisible in a queue for up to 12 hours
* Add to dead letter queues if consumers are unable to process them

### Attributes
* MessageRetentionPeriod(default 4 days, 60s ~ 14 days): a period that message stay in the queue before it's discarded
* VisibilityTimeout(0 seconds ~ 12 hours): the period of time that the message isn't visible **after** the consumer recieve message
* ReceiveMessageWaitTimeSeconds(0 ~ 20 seconds): The maximum of time the long polling can wait before returning the empty result.
* DelaySeconds: the length of time that the queue will wait before initially placing the message in the queue

## Usecase
* Think Lambda first for better scaling
  * Better than auto scaling groups
* Rapid and agile scalibility with SQS, think Lambda first
* Can use ApproximateNumberOfMessages as a metric to trigger auto scaling groups

## API Actions and error
### Common use API
* CreateQueue
* GetQueueUrl
* SendMessage
* RecieveMessage
* ChangeMessageVisibility: Change the visibility timeout of a specified message in a queue to a new value. The maximum allowed timeout value is 12 hours
* DeleteMessage

### SDK Benefits over APIs
* Handles access credentials and signatures
* Deals with automatic retry logic
* Easier to program with
* SDK methods are updated and supported by AWS and the community

### Reference
* [SQS API Actions](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/Welcome.html)
* [Common SQS Errors](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/CommonErrors.html)