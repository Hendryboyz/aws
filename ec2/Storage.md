# Storage
## Elastic Block Storage
### Performance
> IOPS are input/output operations per second

* IOPS measure in 256KB chunks
* Operations are greater than 256KB are seperated into individual 256KB chunks
  * 512KB operation would count 2 IOPS

#### Initialize EBS Volumes
* Initializing occurs the first time a stroage block on the volume is read
  - performance impact can be impacted by up to 50%
* Avoid this impact in production envrionments by manually reading all the blocks

### Types
* Solid State: gp2, io1
* Hard Disk Drives: sc1, st1, standard

### Encryptions
* Encrypt both at rest and in transit using AWS EC2 host
* KMS generate DEKs to encrypt data. Encrypted part of DEKs put in the KMS and decrypted part of DEKs put in the EC2 host
* Encrypted volume can't create uncrypted volume
* KMS(EBS) Encryption can't handle OS level encrpytion

### Snapshots
> Point-in-time backups of EBS volumes that are stored in S3

* Use Data Lifecycle Manager to create/delete snapshots
* Reduce the RPO (Recovery Point Objective) - frequent snapshots
* Degrade performance(IPOS) when taking snapshots

### Notes
* EC2 Dashboard(Right) > Account Attributes > Settings > Enable default encrypt new EBS volumes in entire **region**
* Use snapshots to move EBS volumn between Availability Zones
* Restart doesn't change the EC2 host, so the public ip addess doesn't change
* [Instance permission](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#config-settings-and-precedence)

## Instance Store Volume
> Virtual devices whose underlying hardware is physically attached to the host computer that is running the instance

* Empemeral Data
* Data is erased once the instance is stopped or shutdown
* Depend on the instance, you may have the ability to attach certain volume types (like Instance store)
  - Not all instance types can use instance store volumes

## Elastic File System
* Storage option for EC2 that allows for a **scalable storage** option
* Elastic
  - capacity increase and decrease as files are added and removed
  - only pay for using, don't haveing to provision and attach larger storage devices
* No maintenance required

### Benefits
* Allow to be accessed by one or more EC2 at the same time
* Can be mounted to on-premises servers
  - Direct Connect
  - Backup on-premise servers solution