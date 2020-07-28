# CloudWatch Events
* Allow users to design automatical infrastructure of AWS
* Can trigger actions based on the events
  * CloudTrail just a auditing tool
* Can see the eventsalmost real time
* Enable CloudTrail first, to use the API call as event source
* Developer have to understand the implementation

## Rule
* event source
  * based on event pattern or schedule
  * schedule allow crontab style pattern
* Take action to targets, targets can be
  * EC2 instances
  * Lambda functinos
  * Step Functions state machine
  * SNS topics
  * SQS queues

## Usecase
* Automatically remediatin, responding by events