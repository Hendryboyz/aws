# CloudWatch
> Provdie full suit of metric collection and monitoring functionality
* Repository fo metric data

Push data to cloud watch use: 
* CloudWatch API
* CloudWatch Agent

## Metric
* A time ordered set of data points
* data point is the point in time value
* metric is collection of those data point over time
* metric will be grouped into **namespace**
* allow to take action to metric

## State
* OK
* INSUFFICIENT
* ALARM

## Key Components of alarms
* Metric: the data points over time being measured
* Threshold: Exceeding this is bad
* Period: How long the threshold has been breached before an alarm is generated
* Action: What to do when a alarm trigger
  * SNS
  * Auto Scaling
  * EC2

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