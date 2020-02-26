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

# Key Management Service
* **Regional** security key management
* FIPS 140-2 level 2 validated
* Allow users to create, modify and delete customer master keys
* Handle up to 4KB file
* Only allow to access CMKs with KMS, not allow to access directly
* Allow key rotation my setting
* Allow to use a new key to **re-encrypt** the data and it don't see the plain text 
* Using CMK to generate a data encryption key allow users to encrypt or decryt data in any size

## AWS Managed CMK
* Like S3 managed customer master key

## Customer Managed CMK
* Allow key rotation configuration
* Manage the permission of key via key policies
* Enable/Disable Key

## Data encryption key
* Using CMK to get
  * Data encryption key
  * Encrypted Data encryption Key
* Use Data encryption key to encrypt any size of data and store it with encrypted data encryption key
* Use KMS key policy to give identity permision to access decrypt encrypted dek
* Using the dek to decrypt the encrypted data