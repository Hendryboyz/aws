# Elastic Load Balancing
* Load Balancing is a method used to distribute incoming connections accross a group of servers or services
* Elastic Load Balancing provide three types of highly availability and scalable load balancers
  * Class(Layer3/4)
  * Application
  * Network(Layer4)
* ELBs can be paired with Auto Scaling groups to enhance high availability and fault tolerance - automating scaling/elasticity
* Support SSL offloading: load balancer encrypt/decrypt the data in transit and communicate to backend instances with HTTP
* Cross-zone load balancing allows each node distribution traffic across mulitiple avaialablity zone.(Each load balancing node place in one availability zone)
* Load balancer can be used between tiers(internal facing)
* Generation 2 Load Balancer(ALB/NLB) support Dynamic Ports, so ideals for containerized services

# Class Load Balancer
* Not recommend to use in the new product
* Use CLB deploy EC2 classic(NO VPC support)
* Layer 3 & 4 products(TCP & SSL), it will restrict the health check
* No real HTTPs
* One SSL Cert per CLB - more expensive
* Can offload SSL connection - HTTPs to the load balance and HTTP to the instance
  * Only ELB own the SSL certificate
  * lower admin overhead on the instance certificate
* Select the subnet to deploy load balancer node to improve availability
* Security group in load balancer define the traffic allow to connect to load balancer
  * backend security can only allow the traffic from load balancer (best pratice)
* Enable cross-zone load balancing be default
* the different image with the same name but in the different instance behind the load balancer could be cached by browser(chrome)

## Health Check
* Auto Scaling can use the health check from load balancer
* Select the destination protocol

# Application Load Balancer
* Work at layer 7 of the OSI network model. Operate at application level.
  * Only allow to load balacing HTTP/HTTPS protocol 
* Understand HTTP/S and can load balance based on protocol layer
* Select availability zone(subnet) to put load balancer node like the clb setting
* Load balancing to a new layer **target group**, and target is a certain type of compute services: EC2, EKS, ECS, Lambda, HTTPS, HTTP/2 and WebSockets
* Content rules can direct certrain traffic to specific target groups
  * Host-based rules: based on the host
  * Path-based rules: based on URL path
  * Everything is configured using rules
  * CLB work at layer 3/4, so it can't be routed by path rules(http details)
* Allow to use content rules to use one ALB and one SSL certificate to support many application required to use HTTP/S 
* Allow to integrate with AWS Web Application Firewall(WAF)
* Use ALB if need to use containes or microservices
* Using Server Name Indication(SNI) to host multiple SSL certificates
* Traffic is evenly distributed based on the number of resources assigned to the ELB nodes, even if they are not in the same Availability Zone (known as Cross-Zone Load Balancing).
  * Historically, ELB nodes use to receive traffic evenly. However
* IP Address Type
  * ipv4
  * dualstack: ipv4 + ipv6
* Session stickness setting is put in target group


# Network Load Balancer
* Operate at layer 4(Transport) of the OSI network model
* Load balance any protocols not HTTP or HTTP/S
* Designed for Layer 3 and 4 applcations where HTTP/S is not required
* Capable of scaling to extreme levels of performance.
  * No processing above layer 4 is required
* Source IP address preservation - packets unchanged
* IP addressable - static address
* Allow to register target outside the VPC
* Register target by
  * instance id
  * ip address: source ip address will be the private ip of NLB node, not the original client(NLB will rewrite the http header)
* Session stickness setting is put in target group

# UseCase
## Classic Load Balancer
* EC2 Classic Network

## Application Load Balancer
* Flexible feature set
* HTTP and HTTPS traffic
* Advanced routing feature
* Visibility features targeted at application architectures including microservices and containers

## Network Load Balancer
* Ultra-high performance
* Static IP addresses for your application
* Multiplayer Online Game(TCP socket connection)

# Best Practice
* Use **auto scaling group** to register instance to load balancer instead of adding at the creation time
* With Application load balancer, AWS recommend that pre-warm its ips.
  * Have to pre-warm the instance to handle the incoming traffic
* With Network load balancer, no pre-warming needed to handle the millions of connections
* Session stickyness duration should be more higher than the application login timeout
* Instance wouldn't be terminated by auto scaling if there is any sticy session attached on it.