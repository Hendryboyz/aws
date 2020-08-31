# Advanced Virtual Private Cloud

## VPC Peering
> Direct connect communication between VPCs

* Allow to span AWS accounts and even regions
* **Network Layer** linking
* Peering is a gateway product, so it should be set in the route table(in the two VPC)
* Remember to edit network access control list and security groups
* Cross region peering using the AWS backbone network to connection

### Limitation
* Peer connect actually **two** VPCs - routing is not transitive
* VPCs CIDR block can not be partial or completed overlapping
* Allow reference the security group in **the same region** and **cross account the same region** but not cross-region
* DNS resolution to private IPs can be enabled in requester and accepter side

## VPC Endpoint
> Allow to resources inside the VPCs connect to AWS public services without attaching Internet Gateway or NAT Gateway(be public)

### Types
* Gateway endpoint: DynamoDB and S3
  * Gateway endpoints can be restricted via policies
  * HA accross AZs in a region
  * Prefix list to add routing rule in **route tables**, not using endpoint url
  * Accross AZs, so all subnet can shared a Gateway endpoints

* Interface endpoint: other AWS services
  * Creating a network object(an ENI) **lives in a specific subnet**
  * Not use routes table updates required
  * Can controlled by security groups(in a subnet and having ENI)
  * Add or replicae the DNS for the service

### Reference
* [VPC Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)
* [AWS Service Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html)

## IPv6
### Enable
1. Add IPv6 CIDR in VPC setting
2. Add IPv6 CIDR in subnet setting
3. Add IPv6 routing rule in route tables

### Egress-olny Internet Gateways
> Provide the IPv6 instances with **outgoing only** access to the public internet, but prevent the connection from the public internet

## Transit Gateway
* Allow to have transitive peering between thousands of VPCs and on-premises data centers
* Works on a hub-and-spoke model
* Works on a regional basis, but you can have it across multiple regions
* can use it across multiple AWS accounts using Resource Access Manager
* Use route table to limit how VPCs talk to one another
* Works with Direct Connect as well as VPN connections
* Support **IP Multicast**(not supported by any other AWS service)

## Global Accelerator
> A service in which you create accelerators to improve availablitity and performance of your applications for local and global users.

### Global Accelerator Components
* Static IP address
  * provide 2 static ip address
  * allow users **bring their own** ip address
* Accelerator
  * direct traffic optimal endpoints over the AWS Global network
  * improve the availability and performance of users internet applications
  * one or more listeners
* DNS Name
  * each accelerator have a default Domain Name System(DNS)
  * DNS/IP of accelerator can be used to route the traffic to Global Accelerator
* Network Zone
  * service the static IP addressed for the accelerator from an unique IP subnet.
  * an isolated unit with its own set of phyical infrastructure
  * similar to AWS availability zone
* Listener
  * processes inbound connections from clients to Glbal Accelerator, based on the port(/port range) and protocol that you configure.
  * Support both TCP and UDP protocols
  * one or more endpoint groups associated with it
  * traffic is fowarded to endpoints in one of the endpoint groups
* Endpoint Group
  * Associated with a specific AWS Region
  * Inlcude one or more endpoints in the Region
  * Setting a **trafic dial** can increase or decrease the % of traffic that would be otherwise directed to an endpoint group
  * Blue/Green Deployment
* Endponit
  * NLB, ALB, EC2 or Elastic IP addresses
  * Traffic is routed to endpoints based on configuraion **options**
  * Allow to configure **weights** for each endpoint

### Global Accelerator Notes
* Client affinity: Like sticy session in elastic load balancer. It allow to direct traffic to specific endpoint if users application is stateful.
* CloudFront uses edge locations to **cache content** while Global Accelerator uses edge locations to **find an optimal pathway** to the nearest regional endpoint
* CloudFront is designed to handle HTTP protocol mean while Global Accelerator used for both HTTP and non-HTTP protocols **such as TCP and UDP**

## AWS Private Link
* Opening users' services in a VPC to another VPC
  * open the VPC up to the internet
  * VPC peering
  * **Private Link**
### Pros
* the best way to expose a service VPC to tens, hundreds or thousands of customer VPCs
* Doesn't require VPC peering; no route tables, NAT, IGWs, etc.
* Requires a **Network Load Balancer** on the service VPC and an **ENI** on the customer VPC

## Note
* Every public service have their own public endpoints.