# Database Migration Service(DMS)
* Allows you to move databases to and from AWS
* Might have users' DR environment in AWS and on-premises environment as primary
* Works with most popular database technologies such as Oracle, MySQL, DynamoDB, etc
  * Support **homogenous** migrations
  * Support **heterogeneous** migrations

# Server Migration Service(SMS)
* Server MIgration Server support incremental replication of user' on premises servers in to AWS
* Can be used as a backup tool, multi-site strategy(on-premises and off-premises), and DR tool

## AWS Application Discovery Service
* Helps enterprise customers plan migration projects by gathering information about their on-premises data centers
* Install the AWS Application Discovery Agentless Connector  as a virtual appliance on VMware vCenter
* Build a server utilization map and dependency map of users' on-premises environment
* The collected data is retained in encrypted format in an AWS Application Discovery Service data store. Users can export this data as a CSV file and use it to estimate the Total Cost of Ownership(TCO) of running on AWS and to plan your migration to AWS.
* Data is also available in AWS Migration Hub, which users can migrate the discovered servers and track their progress as they get migrated to AWS

# VM Import/Export
* Migrate existing applications to EC2
* Can be used to create a DR strategy on AWS or use AWS as a second site
* Can also use it to export users' AWS VMs to on-premises data center

# Download Amazon Linux 2 as an ISO