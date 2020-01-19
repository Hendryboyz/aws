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

### Instance Metadata
http://169.254.169.254/latest/meta-data

### Status
Related to the host which EC2 runs on
Related to the EC2 itself

### Notes
* Shutdown but **not stop**, this instance still will be charged
* Hibernate Stop Instance: Stop the instance but keep the instance state, and users can start it with the same state. This is not available for all instance types


## Elastic Block Storage
### Solid State
gp2, io1

### Hard Disk Drives
sc1, st1, standard

### Snapshots
* Use Data Lifecycle Manager to create/delete snapshots

### Notes
* Use snapshots to move EBS volumn between Availability Zones