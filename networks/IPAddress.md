# IP Address
> IP Address have **network** and **host/node** part. Network part can be identified by the subnet mask/prefix.

##  Spcial IP Address
* 255.255.255.255: used to broadcast  to all ip address
* 169.254.0.1 ~ 169.254.255.254: the range of ip address allow the device auto configure (if DHCP failed)
* 127.0.0.1: localhost
* 0.0.0.0/0: means all ip address

## IP Address classes
* Class A(/8): huge organization
  * Private: 10.0.0.0 to 10.255.255.255
* Class B(/16): medium business
  * Private: 172.16.0.0 to 172.31.255.255
* Class C(/24): small business
  * Private: 192.168.0.0 to 192.168.255.255

  ##   Classless Intra-Domain Routing(C.I.D.R)
> Allow to allocate sub networking more efficiently. C.I.D.R tell us the prefix of the ip address and prefix define which part of a ip address is network part and remaining is host part.

Note:
* Prefix define the size of the networks

Example: 
* /16: first 16 bits is the network part
* /24: first 24 bits is the network part