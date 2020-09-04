# VPC Flow Logs
> Allow to capture metadata about the traffic flowing in and out of networking interfaces within a VPC. 

* Log the traffic in / out the network interface
* Allow to store either S3 or CloudWatch Logs
* Allow to create multiple VPC FlowLogs
* Not a real time product
* Only capture metadata - not capture the actual traffic

## Monitor by VPC Flow Logs
* account-id
* interface-id
* source address, port
* destination address, port
* protocol
* packets
* bytes
* start, end
* action
* log-status

## Where to attach
* VPC
  * Every Network Interface in the VPC
* Subnet
* Network Interface(ENI)
* Auto apply the VPC Flow Logs down Subnet or ENI 

## Log Traffic Exception
* Amazon DNS server, but traffic would be logged if users use their own DNS server
* Windows instance for Amazon Windows license activation
* 169.254.169.254 for instance metadata
* DHCP
* traffic to the reserved IP addresses for the deafult **VPC router**