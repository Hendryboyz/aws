# Networks

## Firewall
> Firewall is capable of reading packet and either allowing or denying traffic based on the rules

* Network: range of IP address
* Transport: TCP/IP or UDP and specific ports
* Session: Security Groups in AWS
* Application: Prevent like SQL injection

Note: higher level of firewall will cost more compute resources

## Proxy Servers

## Costs
* Internet traffic in VPC: free
* Using **Private IP** in **the same availability zone**: free
* Using **Private IP** in **the different availability zone**: $0.01/gig
* Using **Public IP** to connect the **different availability zone**: $0.02/giga
* Region to region: $0.02/giga

## Note
* Using private IP over public IP to save on costs
  * utilizes the AWS backbone network
* Cut all network costs, group your EC2 instances in the same Availability zone and use private IP. This will be cost-free
  * single point of failure issues(lose availability zone)