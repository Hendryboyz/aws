# Storage Gateway
> a hybrid storage service that allows you to connect on-premises data center with AWS storage service

* virtual appliance to run in users' hosts

## File Gateway
* Present its storage as SMB shares that are shares to use in the **Windows Server**

## Volumn Gateway
* instead SMB shares, users access volumn over a protocol, which is called iSCSI
* iSCSI is used to NAS product or SAN product
* network attached storage/volumn
* Not allow to access the files individually without mounting the entire volumn

### Gateway stored volume
* all the data store in the gateway
* snapshot to taken aws s3

### Gateway cache volume
* store primary of data inside the aws
* download or uploads any data that's frequently accessed and store temporary copy of data on volume gateway
* only samll amount of data on the cache volume, others data store to S3
  * allow to leverage AWS unlimited storage in S3

## Virtual tap library(VTL)/Tap Gateway
* Backup to S3
* Reduce backup admin overhead