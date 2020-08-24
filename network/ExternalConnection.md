# VPC VPN
> Configure a hardware based highly available VPN connection between your VPC and on premises networks

## Components
* Customer Gateway(CGW): a physical piece of hardware(router) **at customer side**.
* Virtual Private Gateway(VGW): a gateway entity can be attached to route table like internet gateway, egress only internet gateway
  * Only can be attached to a single VPC
* Side to side VPN connection: logical entity that links the VGW and CGW
* Static Routing: simplest routing inside AWS VPN which tell either side of the VPN connection what subnets are available at the remote end of the connection.

## Best Practice
* Use Dynamic VPNs(Uses BGP) where possible
* connection to two different customer gateway on two different IP addresses
* use two VPN connection in different availability zone for each CGW
* Only need one VGW because VGW is high available by design

## Usecase
* To be done quickly
* Bill per hour to run VPN connection as well as a data charge for any outgoing data.
* Cheaper than Direct connect

# Direct Connect
> high-speed, low-latency **physical connection** providing access to public and private AWS services from your business premises

* Physical private connection between on premises network and AWS
* Physical fiber run between on premises network and AWS
* There is many **DX location** distribute globally
* Have to find AWS partner who put the router inside the DX location
* by default, data is unencrypted in transit

## Virtual Interfaces(VIFs)
* public VIF: allow to connect from on-premise equipment through to **any public AWS services**
* private VIF: llow to connect from on-premise equipment through to **specific VPC**
  * via Virtual Private Gateway

## Usecase
* Need speed and consistency
* Don't have to traverse to public internet, so latency is low(consistent)
* Can NOT provisioned quickly

# VPN side to side connection V.S. Direct Connnect
## VPN
* Urgent need - can be deployed in minutes
* Cost cont
* Low end or consumer hardware - DX requird BGP
* Encryption required
* Flexibility to change locations
* High avaiable options avaiable

## AWS VPN CloudHub
* If you have multiple sites, each site with its own VPN connection, you can use VPN CloudHub to connect those sites together
* Hub-and-Spoke model
* Low cost, easy to manage
* It operates over the public internet, but all traffic between the customer gateway and AWS VPN CloudHub is encrypted

## Direct Connect(DX)
* Low latency
* Higher throughput(performance)
* Consistent high throughput and low latency
* Move huge large amount of data between AWS and on-premises
* Take time to provision
* After finishing, allow to download LoA(Letter of Authorization) and CFA(Connection Facility Assignment) manually.
* Require single-mode fiber: provide 1 Gbps and 10 Gbps connection

## Both
* VPN as a cheaper HA option for DX
* VPN as an additional layer of HA
* Use VPN before Direct Connect is live
* Can be used to add encryption over the top of a DX(public VIF VPN)