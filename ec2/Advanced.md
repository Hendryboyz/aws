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