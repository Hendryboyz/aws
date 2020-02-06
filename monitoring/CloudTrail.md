# Cloud Trail
> goverance, compliance, risk management, and auditing service that records account activity within an AWS account.

* View the last 90 days of events.
* Send to storage on a periodic basis into storage, not a real time product
* Allow to integrate with CloudWatch 
* Enable default in brand new AWS account, but old account have to create Trails mannually

## Trail
* unit of configuration for cloud trail
* where the data logged to
* what ot log
* per region configuration
* allow to apply trail to the organization
* can store log to s3 in other AWS accounts

### Management Events
* Log control plane events

### Data Events
* Support S3, Lambda

## Best Practice
* Create earlier to prevent security exploit
* When a new account create, create the trail after billing alert setting up