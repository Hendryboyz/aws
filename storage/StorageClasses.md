# Storage Class
Storage Classes influence the cost, durability, availability and "first byte latency" for objects in S3.

## Standard
* 11,9 durability
* 99.99% availability, replicate 3+ AZs
* Only standard don't have retrieval fee
* No minimum object size and duration charge

## Standard - Infrequent Access
* 11,9 durability
* 99.9% availability, replicate 3+ AZs
* object retrieval fee
* minimum charges is to store 30-day * 128KB file 

## Standard - One Zone Infrequent Access
* Non-critical and/or reproducible objects
* 11,9 durability
* 99.49%(99.5%) availability, **only 1 AZs**
* minimum charges is to store 30-day * 128KB file 
* sacrifice availability to get cheaper price in standard class

--- above allow access data(First byte latency) immediately ---

## Glacier
* Long-term archival storage(warm or cold backups)
* Retrieval could take minutes or hours(pay for faster)
* 99.99% availability, 3+ AZ replication
* Retrieval fee
* minimum charges is to store 90 day * 40KB files

## Glacier Deep Archive
* Long-term archival storage(cold backups)
* Retrieval could take hours
* 99.99% availability, 3+ AZ replication
* minimum charges is to store 180 day * 40KB files
* longer retrieval time but cheaper than Glacier - tape-style storage

## Reference
* [Official Class Storage Reference](https://aws.amazon.com/s3/storage-classes/)
* [Retrieve Glacier Data](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/restore-archived-objects.html)

# Storage Class Management
## S3 Intelligent-Tiering
> optimize storage costs automatically when data access patterns change, without performance impact or operational overhead

* Pay monthly automation and monitoring fee
* Don't pay any retrieval costs
* Design for data with unpredictable or unknown access pattern
* Automatly move data between frequent or infrequent access tiers
* Object aren't accessed for 30 days are moved to the infrequent tier which offers lower costs


## Lifecycle Policy(Rules)
> allow objects or versions to be transitioned between storage classes or expired when no longer required

* bucket level
* allow to enable/disable
* Allow expire(delete) current/previous version of data automatically
* Allow to filter by prefix or tag
* noncurrent = old version of object
* Not allow to go back standard by lifecycle rules
* Objects smaller than 128KB cannot be transitioned into Intelligent-Tiering
* Objects must stay in the original storage class for a minimum of 30 days before transitioning before tiers
* minimum charges is to store 30 day files
