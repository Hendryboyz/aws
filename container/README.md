# Container

## Properties
* Containers always are compare with Virtual Machine

|     |Virtual Machine|Container|
|---|---|---|
|OS|Separated|Shared the OS and Infrastructure|
|Isolated Machenism|Hypervisor|Container Engine|
|Isolation|Operating System|Process|
|Metapher|House|Department|

* Docker image specify how to create container and docker will follow the definition of images to create the container
* Container is an islolated environment for containerized application
* Image can be uploaded to the private **container registry**(image repository) for version control.
* Dockerhub is the most popular public container registry

## Elastic Container Service
### EC2 Mode
> ECS create and manage the EC2 instances which are used to be container hosts

**Clusters Template**: EC2 Linux(WIndows) + Networking

* EC2 Mode will have some EC2 instances resources to be charged

### Farget Mode
> Conatiner hosts are fullly managed by AWS

Cluster Template: Networking only

### Task Definition
 > Define how to run containerized application in the ECS

* one application may container many containers
* task role: just like EC2 instance profile and lambda execution role, it give container the permission to interact with other EC2 services
* task role is used for specific purpose, so it should consider the situation to use this role
* using the **task** in the cluster to run the copy of task definition

#### Container Definition
> Inside task Definition, define the individual containers a Task uses. It controls the resources (CPU, MEMORY and PORTS) each container has.

### Services
> Allow task definition to be scaled up/down by adding additional tasks.