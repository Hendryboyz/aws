# Domain Name System

## Terminologies
* Resolver: take the provided DNS name and find the associated IP address
  * VPC network +2 is the DNS resolver in VPC
* DNS root: top level of the global DNS server. It manage the top-level domain
* Top-level Domain(TLD): 
* Subdomain: 
* Zone and Zone Files: mapping of IPs and hosts for a given domain. The database of DNS.
* Name server: the servers host database(zone)

## Private v.s. Public zone

### Properties
* Public Zone: default type of zone if users create or register a zone in Route53. It can be access globally from the Top-level Domain.
  * Available globally
* Private Zone:
  * Have to enable DNSHostnames and DNSSupport on a VPC
  * Available only in the VPC

### Split Name
> Create private and public zone with the same name and same name record. The private zone override the public zone in the VPC.

## Record Set

### Types
* A Records: translate the given record to **IPv4** IP address
* AAAA Records: map the given record to **IPv6** IP address
* CNAME Records: allow to reference existing record.
* MX Records: Mail exchange record. Provide the mail servers for a given domain.
* NS Records: Used to set the authoritative srevers for a subdomain. For delegating.
* TXT Records: Used to verify domain ownership
* Alias Record Types
  * AWS Features not a standard record
  * extensions of CNAME - use like an A record
  * Point to logical resources in AWS
  * Recommend to use Alias at most of the scenario

## Healthy Check

### Types
* Endpoint Check
* Status of other health checks: health check the summaries of other health check result
* Status of CloudWatch alarm: used to health check other AWS resources involved to the the application

### Endpoints
* HTTP and HTTPS
  * Connection check is less than 4 secs
  * Reporting have to be 2xx or 3xx status code
  * Can allow response must match some string pattern
* TCP: connection check is less than 10 secs

### Advanced Configuration
* Request Interval: default 30secs, fast 10 secs
* How quick Route53 can tell a unhealthy resource is determined by failure threshold and request interval