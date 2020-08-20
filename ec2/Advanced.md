# Advanced EC2 Concept
## Network
* Private IP
  * Attached to instance when instance launching
  * Resources in AWS is natively private when using IPv4
  * Deallocated after instance is terminated
* Public IP
  * Attached to instance when instance start
  * Doesn't change if reboot the instance
  * Internet Gatway will swap ip address between public and private
  * Network Address translation between private and public address
* Public DNS Name
 * Resolve with public ip address out the VPC
 * Resolve with private ip address in the VPC

## EBS Optimization
* Because EBS is a seperated network storage, so not optimized EBS share the path will be shared by network and storage
* Optimized EBS will seperate the path of EBS and network
  1. Access better and faster
  2. Improve network transfer rate
  3. Higher consistency for both network and EBS
* Current generation of instance type by default optimized EBS, but previous generation instance have to optimize explicitly(Cost Extra)

## Enhanced Network
* SRIOV: single root input output virtualization let single network card to appear as mutiple network cards
* New generation allow enhanced network by default
* Use two type of adapter to achieve enhanced network
  * Elastic Network Adapter
  * Intel 82599 Virtual Function (VF) interface(Intel Virtual Adapter)

## EC2 Hibernate
> Hibernate **saves the contents** from the **instance memory (RAM)** to Amazon EBS root volume. We persist the instance's Amazon EBS root volume and any attached Amazon EBS data volumes.
* Amazon EBS root volume is restored to its **previous state**
* **RAM contents** are reloaded
* **Processes** that wer previously running on the instance are resumed
* Prviously attached data volumes are **reattached** and the instance **retains its instance Id**

### **Pros**
With EC2 Hibernate, the instance boots much faster. The in-memory state(RAM) is preserved to EBS root volume.

This is useful for: 
* Long-running processes
* Services that take time to initialize

### Limit
* Instance RAM must be less than **150 GB**
* Instance families include C3, C4, C5, M3, M4, M5, R3, R4, R5, and T2.
* Available for Windows, Amazon Linux 2 AMI and ubuntu 
* Instance can not be hibernated for more than **60 days**
* Available for **On-Demand** instances and **Reserved Instances**

## Placement Groups
* Cluster
  * Performance
  * Limited to one availability zone(Physical close to each other)
  * Much better with the enhanced network
  * Picking the same type of instance is the best practice
* Partition
  * Large infrastructure platform
  * Isolate group of infrastructure
  * Infrasture spread
* Spread
  * Maximum availability
  * Pure for availability

## Advanced Billing Model
> Notify the usage of EC2 capacity to help AWS solve the problem of purchasing too much spare devices.  
> It can let AWS provide some discount for customers

### Spot Instance
* Spot prices will increase or decrease depends on the remaining instance amount
* Warning in 2 minutes before instance is terminated
* Save as much as 90% of on-demand pricing
* The application can tolerate instance has been terminated(failure tolerate)
* Store state external(Stateless server)
* Not time sensitive  

Spot Fleet: A container making the request to reserve spot instances capacity


### Reserved Instance
> Provide AWS furture usage capacity for discount

* Allow to cross region or availability zone
* Launch the instance that match the reserved plan, and get the reserved discount rate.
* **Zonal reservervation**: Only allow to launch the specific instance type and size in the contract.
  * Allow capacity reservation
* **Regional reservation plan**
  * Allow part of discount for bigger instance size
  * Allow instance with smaller sizes get the discount rate

## Elastic Network Interface
* eth0 is default network interface(primary network interface) for each instance
  * Can NOT detach primary network interface from an instance
* ENI place to the subnet
* The security group of each instance is attached on ENI
* While detaching and reattaching to intances, the attributes and **traffic follow the Elastic Network Interface**

## High Performance Computing

### **Data Transfer**
* Snowball, Snowmobile
* AWS DataSync to store on S3, EFS, FSx for Windows, etc
* Direct Connect: pirvate connectivity between AWS and users data center
  * reduce user' network costs
  * increase bandwidth througthput
  * provide a more consistent network experience

### **Compute and Networking**
* EC2 instances that are GPU(G and P type) or CPU(C type) optimized
* EC2 fleets(Spot instances or Spot Fleets)
* Placement groups(cluster placement group)
* Enhanced Networking: use single root I/O virtualization(SR-IOV) to provide high-performance networking capabilities on supported instance types.
  * Elastic Network Adapters(ENA): support network speeds of up to 100 Gbps
  * Elastic Frabric Adapters: network device to attach to EC2 instance to accelerate HPC and machine learning applications.

### **Storage**
* EBS: Scale up to 64,000 IOPS with Provisioned IOPs
* Instance Store: ephemeral storage; scale to millions of IOPS; low latency

\> **Network Storage**
* Amazon S3: distributed object-based storage; not a file system
* Amazon EFS: scale IOPS based on total size, or use provisioned IOPS
* Amazon FSx for Lustre: HPC-optimized distributed file system; millions of IOPs, which is also backed by S3

### Orchestration & Automation
* AWS Batch
* AWS ParallelCluster