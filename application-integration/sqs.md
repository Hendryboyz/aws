# Simple Queue Service
* Long pull is more efficent than short pull
* Consuming the message only cause messages are hidden. Message have to be deleted manually or over the retention period.
* Delete message: send the **receipt handle** of the message back to sqs to delete message

## Message Attributes
* MessageRetentionPeriod(default 4 days, 60s ~ 14 days): a period that message stay in the queue before it's discarded
* VisibilityTimeout(0 seconds ~ 12 hours): the period of time that the message isn't visible **after** the consumer recieve message
* ReceiveMessageWaitTimeSeconds(0 ~ 20 seconds): The maximum of time the long polling can wait before returning the empty result.

## Usecase
* Think Lambda first for better scaling
  * Better than auto scaling groups
* Rapid and agile scalibility with SQS, think Lambda first
* Can use ApproximateNumberOfMessages as a metric to trigger auto scaling groups
