# Elastic Beanstalk
* Platform as a Service
* Low level infrastrucutre control
  * Minimum admin overhead
* Require to design the code for Beanstalk
* Developer should know more about Elastic Beanstalk

## Environment
* Worker: process **long-running workloads** on demand or perform task on a **schedule**
* Web server: website, web application, web api serve **HTTP request**

## RDS deployment
* Launch within Elastic Beanstalk: support launch RDS inside Elastic Beanstalk environment
  * lifecycle of database is tied to the application environment
  * good optino for DEV or Test environment
  * NOT be ideal for production
* Launch outside of Elastic Beanstalk: Deploy RDS outside the application environment, there are two additional configuration
  * additional Security Group must be added to environment's Auto Scaling Group
  * provide connection string configuration information to application servers

## Configuration
* Allow to customize the elastic beanstalk envrionment by adding configuration files
* JSON or YAML format and have a .config file extension
* saved inside a folder called **.ebextensions**
  * must be included in the top-level directory of the application source code bundle

## Components
* Application: the container with an actual version of application code
* Environment: application allow to own multiple environments
  * Environment live in Application Container
* ApplicationVersion: a distinct version of the application code that packaged into a source bundle
  * Application Version deploy to the Environment

## Deployment Options
* All at Once: deploy the application version to instances inside an environment at the same time
  - deploy the new version to all instances simultaneously
  - all instances are out of service
  - not ideal for mission-critical production systems(experience outage)
  - if update fail, roll back the changes by re-deploying the original version to all instances
* Rolling: Split instances into batches and deploys one batch at a time
  - deploy the version in batches
  - each batch of instances is taken out of service
  - not ideal for performance sensitive systyems
  - if update fail, perform an additional rolling update
* Rolling with additional batch: using new batch, deploying testing before removing the old batch(have to pay for the instancesin the additional new batches)
  - launches an additional batch of services
  - deploy the new version in batches
  - maintain full capacity during updates
  - if update fails, perform an additional rolling update
* Blue/Green(Immutable deployment): Maintain two environments, deploy and swap CNAME
  - deploy the new version to a fresh group of instances in their own new autoscaling group
  - while the new instances pass their healthy check, switch the CNAME to new version of autoscaling group, and old instances are terminated
  - maintain full capacity during the deployment process
  - if update fails, rollback only terminate the new autoscaling group and switch CNAME back to old instances
  - perferred option for mission critical production systems