# Virtual Private Cloud
## Properties
* VPC and Subnet limitation: /16(65536 IPs) ~ /28(16 IPs)
* Isolated from other VPC default(from other account absolutely)
* Each VPC can only be applied one DHCP option set
* DHCP option can't be updated, and can only create a new one

## Default VPC
* Required for some services, used as a default for most
* Configured using a /16 CIDR block(172.31.0.0/16)
* DNS hostname is enable by default

## Custom VPC
* Tenancy
  * Default: can later choose to deploy VPC to other hardware, using share hardware
  * Dedicated: lock vpc resource to a dedicated hardware
* Users have to enable DNS hostname manually

## Subnet
* Be created in specific availability zone and can't span accross AZs
* Availability zone can have a lot of subnets, but subnet can only be a single AZ.
* In different account, availability zone **name** is **not mapped** to the same availability zone **id**
* reserved 5 ip address each subnet
  * .0: network
  * last: broadcast
  * .1: VPC router
  * .2: DNS within VPC
  * .3: reserved for future using
* public subnet
  1. make subnet can allocate public IPs by default
  2. allocate internet gateway
  3. add a new public route table and assign internet gateway to it
* private subnet
  * by default, subnet is private
  * no internet access

## Routing
* VPC Router: route the traffic between different subnet within the VPC
* VPC Router can be controlled by **route tables**
* **Don't** modify the default(main) route table, and keep it private
* If need public routing, please create a new route table(best practice)
* Dynamic routing: learn route from Border Gateway Protocol(BGP)
  * Advertise and learn route from other route tables
  * Direct Connect and VPN

## Network Access Control Lidt
> process data as it enters and leaves VPC subnets and authroizes traffic to be allowed or denied based on protocol/IP/CIDR/port range
* **Transport Layer** filtering product in AWS VPCs
* NACLs can be attached to multiple subnet, but single subnet can only attach with one NACL
* NACLs controll the traffic **outside the subnet**
* rule number is higher priority with the lower number
* traffic will be processed by each rule until any rule can match the traffic.
* ACL after creation deny any traffic by default.
* ACL can not reference logical AWS resources(e.g. NAT instance).
* **Stateless** means it don't understand what is session. Users must be assigned inbound and outbound rules.
* Use security groups if you have deny traffic explicitly

### Reference
* [Ephemeral Ports in NACLs](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html#nacl-ephemeral-ports)

## Internet gateway
> handle the traffic to and from public internet

* Have to attach to specific VPC to make it working
* Internet gateway can only be attached to one VPC
* A VPC can only attach one internet gateway
* internet gateway accross multiple availability zone
* Do static network adress translation to translate private address to public ip address
* In AWS, no internal product ever has a public IP adrress on the operating system.
* Use a single route table for internet gateway (public internet access)

## Bastion Host
> a physical or virtual machine sit in the public subnet allowing the users to confugre and update the resource in the private subnet

* Must be kept update and security hardened and audited regularly
* Mutifactor authentication, ID federation and/or IP blocks

## Network Address Transfer
> a process of mapping the source or destination IPs of packets.

* Static: 1 private IP translate to 1 public IP. this is the job of **internate gateway**
* Dynamic: many priavate IP address to get outgoing internate accessusing a smaller number of public IPs(generally single)

### NAT Gateway
* in a single availability zone, not provide high availability
* every subnet should have its own NAT gateway
* provide the scaliblity to fit the request load
* should use single route table for each subnet(availability zone)
* **session layer** product
* supports 5 Gbps of bandwidth and automatically scales up to 45 Gbps

### NAT Instance
* Have to disable Source/Destination Check setting in EC2 to make the NAT instance work

### Reference
* [Comparison Instance and Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html)
* [SSH Agent Forwarding](https://aws.amazon.com/blogs/security/securely-connect-to-linux-instances-running-in-a-private-amazon-vpc/)