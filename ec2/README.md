## Elastic Cloud Computing Service
* [Instance Store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html): Attached to EC2 instance host. If the host fail and EC2 will lost all the data in that instance store volume
  * Better performance available than EBS volume(Don't need to use network)
  * Ephemeral Storage
  * Only support certain types of instance
  * IOPS requirement is larger than 80,000
* [Elastic BlockStore(EBS)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html): Network block store service available within AWS
  * EBS volume shoud be the same AZ with EC2 host

### Instance Type Format
(InstanceFamily)(Generation)(Features).(Sizes)
**Example**
* m5.nano
* m5dn.8xlarge
* c5n.metal

**Features**
* d: instance store(NVMe storage)
* n: network optimize
* a: AMD CPU

## Instance Features
### Instance Metadata
http://169.254.169.254/latest/meta-data

### Status
System Status: Related to the host which EC2 runs on
Instance Status: Related to the EC2 itself

### Dedicated Host
Require a unique phsyical host for specific requirement. It give customers complete control over physical instance placement and dedicated hardware free from other customer interaction.
* Meet Compliance and Regulatory reason
* Licensing software model
* Control instance placement

### Notes
* Shutdown but **not stop**, this instance still will be charged
* Hibernate Stop Instance: Stop the instance but keep the instance state, and users can start it with the same state. This is not available for all instance types


## Elastic Block Storage
### Types
* Solid State: gp2, io1
* Hard Disk Drives: sc1, st1, standard

### Encryptions
* Encrypt both at rest and in transit using AWS EC2 host
* KMS generate DEKs to encrypt data. Encrypted part of DEKs put in the KMS and decrypted part of DEKs put in the EC2 host
* Encrypted volume can't create uncrypted volume
* KMS(EBS) Encryption can't handle OS level encrpytion

### Snapshots
* Use Data Lifecycle Manager to create/delete snapshots

### Notes
* EC2 Dashboard(Right) > Account Attributes > Settings > Enable default encrypt new EBS volumes in entire **region**
* Use snapshots to move EBS volumn between Availability Zones
* Restart doesn't change the EC2 host, so the public ip addess doesn't change

## Amazon Machine Images(AMIs)
 > Container which reference the snapshot that are created from the original instance

 ### Create AMI Steps
 1. Snapshot the original instance 
 2. Permission
 3. Block device mapping

 ### AMI v.s. bootstrapping(User Data)

 |AMI Baking|Bootstrapping|
 |---|---|
 |Not dynamic configuration required|Dynamic Configuration|
 |Long installation|Short installation|
 |Lengthy static configuration|Anything dynamic|

 ### Note
 * Immutable Architect: The server state never change after creation. It don't adjust server if any problems just create a new one.
* Bootstraping support two distinct way. First is shell script and the second is [cloud init](https://cloudinit.readthedocs.io/en/latest/).