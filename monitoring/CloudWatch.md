# CloudWatch
> Provdie full suit of metric collection and monitoring functionality
* Repository fo metric data
* Minimum granularity is **1 minute**
* Store indefinitely by default
* Allow to retrieve data from any terminated EC2 or ELB
* Allow to use on premise
  * SSM agent
  * CloudWatch agent

Push data to cloud watch use: 
* CloudWatch API
* CloudWatch Agent

## Metric
* A time ordered set of data points
* data point is the point in time value
* metric is collection of those data point over time
* metric will be grouped into **namespace**
* allow to take action to metric
* Granularity
  * 1 minute for detailed monitoring
  * 5 minutes for standard monitoring
  * 1 hours
* Retenstion period
  * 1 minute metric are available for 15 days
  * 5 minutes metric are available for 63 days
  * 1 hour metric are available for 455 days

# Cloud Watch Alarm
## State
* OK
* INSUFFICIENT
* ALARM

## Key Components of alarms
* Metric: the data points over time being measured
* Threshold: Exceeding this is bad
* Period: How long the threshold has been breached before an alarm is generated
* Action: What to do when a alarm trigger
  * Simple Notification Service: trigger a single topic
    * a topic can be subscribed by **Lambda**, **Simple Queue Service(SQS)**, HTML, email, application, Simple Mail Service(SMS)
  * Auto Scaling: scale up/down scenario
  * EC2: recover, stop, terminate or reboot

# CloudWatch Logs
* collect and store log data(events)
* Log Event: a timestamp and a raw message
* Log Stream: a sequence of log events
* Metric filter: use a pattern matches text in all log events in the whole log group.
  * Use filter to create the customize metrics
* Log Group
  * configure export setting as well as other AWS services
  * allow to export to S3
* Provde integration with other services(including custome applications)
