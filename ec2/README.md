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
* Display bootstrap scripts: curl http://169.254.169.254/latest/user-data/
* Display instance metadata: curl http://169.254.169.254/latest/meta-data/

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


## Elastic IP Address
* Region level resource, not a availability zone resource
* Charge if allocating, no matter it is used or not

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

## Network
* Elastic Network Interface: virtual network card

* Enhanced Network: provide high performance networking capabilities on supported instance types

* Elastic Fabirc Adapter: device for EC2 to accerlerate High Performance Computing(HPC) and machine learning application

### ENI
> For basic networking. Perhaps you need a separate management network to your production network or a separate logging network and you need to do this at low cost. Use multiple ENIs for each network

### Enhanced Networking
> Require speeds between 10 Gbps and 100 Gbps. Required reliable, high throughput

* Use **single root I/O virtualization (SR-IOV)** to provide high-performance network capabilities
*  Depending on **instance type**,  enhanced networking can be enabled using:
  * Elastic Network Adapter: support networ speeds of up to **100 Gbps** for supported instance types
  * Intel 82599 **Virtual Function** interface: for older instance to increase network speeds up to 10 Gbps

### ENA
> Require accelerate High Performance Computing (HPC) and machine learning applications or if OS-bypass is required

* Elastic Fabirc Adapter: device for EC2 to accerlerate High Performance Computing(HPC) and machine learning application
* provides lower and more consistent latency and higher throughput that the TCP transport traditionally used in cloud-based HPC systems
* Support OS-bypass.
  * OS-bypass enables HPC and machine learning applications to bypass the operating system kernel
  * communicate directy with the EFA device
  * make it a lot faster with a lot lower latency
  * only support Linux 