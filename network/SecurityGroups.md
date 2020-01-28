# Security Groups
* Security groups are attached on the Elastic Network Interface(ENI)
* Each ENI can allow to be attached maximum 5 security groups
* Default deny all inboud traffic(implicitly)
* Not allowed to deny rule
* Belong to specific Virtual Private Cloud
* Allow to reference other logic entities(othrer security groups) in AWS

## Stateful
* Allow return traffic automatically
* Security groups will trace the **request state**(originating traffic) and allow response(destined traffic) automatically 