# AWS Directory Service
* Family of managed services
* Connect AWS resources with on-premises AD
* Standalone directory in the cloud
* Use existing corporate credentials
* SSO to any domain-joined EC2 instance

## Amazon Cognito User Pools
* Managed user directory for SaaS applications
* sign-up and sign-in for web or mobile
* Works with **social media** identities

## Cloud Directory
* Directory-based store for **developers**
* Multiple hierarchies with hundreds of millions of objects
* Use cases: org charts, course catalogs, device registries
* Fully managed service

## Active directory
* On-premises directory servcie
* Hierarchical database of users, groups and computers - **trees** and **forests**
* Group policies
* LDAP(Light weight directory access protocol) and DNS(Domain name service)
* Support Kerberos, LDAP and NTLM authentication
* Highly available

### Share responsitility
**AWS**
* Multi-AZ deployment
* Patch, monitor, recover
* Instance rotation
* Snapshot and restore

**Customer**
* Users, groups and group policy objects(GPOs)
* standard AD tools
* Scale out DCs
* Trusts(resource forest)
* Certificate authorities(LDAPs)
* AD Federation

## Simple AD
* Standalone managed directory
* Basic AD features
* two size to deploy simple AD
  * small: <= 500 users
  * large: <= 5000 users
* easier to manage EC2
* Linux workloads that need LDAP
* Does not support **trusts**(can't join on-premises AD)

## AD Connector
* use users' existing on premises directory with compatible AWS services
* Directory gateway(proxy) for on-premises AD
* Avoid caching information in the cloud
* Allow on-premises users to log in to AWS using AD
* Join EC2 instances to your existing AD domain
* Scale across multiple AD connectors

## Compatibility
### AD Compatible
* Managed Microsoft AD(a.k.a, Directory Service for Microsoft Active Directory)
* AD connector
* Simple AD

### **NOT** AD compatible
* Cloud Directory
* Congito user pools
