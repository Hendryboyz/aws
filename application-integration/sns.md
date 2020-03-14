# Simple Notification Service
* Pub-sub service 
* The concept of fan out scenarios is the usecase for SNS
* Coordinates and manages the sending and delivery of messages to specific endpoints
* Events occur in our AWS environment can send the notification to SNS
* 

## Components
### Topics
* the group of **subscriptions** that you send a message to
* unique names limited to 256 characters
* names allow alphanumeric characters plus hyphens and underscores
* topics and messages are stored redundantly across multiple servers and data centers 

### Subscribers
An endpoint that a message is sent to and available endpoints include:
* HTTP/S
* Email(-JSON)
* SQS
* Application, mobile app notifications(iOS/Android/Amazon/Microsoft)
* Lambda
* SMS(cellular text message)

### Publishers
Entity that triggers the sneding of a message
* AWS CLI/SDKs
* AWS services
  - S3 events
  - CloudWatch alarms
  - Using Lambda to push to SNS

### Messages
* Message content depends on the subscriber
* POSTs to HTTP/S endpoints with specific headers:
  - Headers allow verification of message authenticity
* JSON foramtted key-value pairs
* Allow developers to grab message data and parse it

## SNS resource base policy
* Grant permission to another AWS account to access your SNS topics
  - use SNS **AddPermission** API to 
    - Topic, AWS account ID(s), Actions, Label
    - Automatically generate an access control policy to SNS
* Grant access to some AWS services to push to your SNS topics
* Allow to use IAM polices and access control polices at the same time

## Mobile Push Notification Services(MPNS)
* Send notifications directly to apps on mobile devices
* Notifications sent to these endpoints can appear as messeage alerts, badge updates and sound alerts
* MPNS Process: SNS requires 'device tokens' or 'registrations IDs'(depending on the platform) to send messages to devices
* Different providers allow you to send notifications to different devices:
  - Amazon device messaging(ADM)
  - Apple push notification service(APNS)
  - Baidu Cloud Push
  - Google Cloud Messaging for Android
  - Microsoft Push Notification Service for Windows Phone
  - Windows Push Notification Services

## API actions
Common Actions
* CreateTopic
* Publish
* Subscribe
* Unsubscribe

### Reference
* [API actions](https://docs.aws.amazon.com/sns/latest/api/API_Operations.html)
* [SNS Errors](https://docs.aws.amazon.com/sns/latest/api/CommonErrors.html)