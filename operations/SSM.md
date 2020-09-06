# System Managers
> System Manager helps you automatically collect software inventory, aply OS patches, create system images and configure Windows and LInux operating systems.

System Manager cna be used for both EC2 instances and for compute instances located in your own data centers. These capabilities help you define and track system configurations, prevent drift and mantain software compliance of your EC2 and on-premises configurations.

## Parameter Store
* Component of AWS Systems Manager
* Secure **serverless** storage for configuration and secrets:
  * Passwords
  * Database connection strings
  * License codes
  * API Keys
* Values can be stored ecrypted(KMS) or plaintext
* Separate data from source control
* Store parameters in **hierarchies**
  * allow up to **15 levels** deep
  * GetParametersByPath
* Track versions
* Set TTL to expire values such as passwords