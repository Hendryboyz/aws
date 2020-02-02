# Launch Configuration/Templates
> Define **WHAT** users want to launch in the auto scaling group

## Configuration
Launch Configuration have assign: 
* AMI to use for instance
* Instance Type
* Storage
* IAM role
* User Data
* Purchase options(Spot instance)
* Network configuration
* Security Group(s)

Note :
* the creation process like launch a EC2 instance
* Launch configuration can't be changed after creation, users just allow to create a new one
* static and immutable object
* Can not be used to launch a EC2 instance

## Launch Template
Features:
* Versioning and inheritance
* Tagging
* More advanced purchasing options
* Instance feature
  * Elastic graphics
  * T2/T3 unlimited settings
  * Placement groups
  * Capacity reservation
  * Tenancy options

Note:
* Launch template is still immutable but users can create a new version of the template
* Not only can be used to create auto scaling groups but can be used to launch the normal ec2 instances
* Always to prefer launch template

# Auto Scaling Group
> Utilize launch configuration/templates(What) to define the behavior of scale-in/out based on configurable metrics

* Elasticity: scale depends on server load automatically
* Allow to combine purchase options and instances in auto scaling group setting
* Use certain monitoring metric and based on it to increase or decrease the desired capacity
* Associate to CLB directly
* Associate to Target Group if the load balancer is ALB

## Terminologies
* Minimum Size: minimum number of instances that the auto scaling group can have in it(no load)
* Maximum Capacity: never grow the size more than maximum capacity
  * cost saving value
* Desired Capacity: the number of instance that auto scaling group attempt to launch
  * Auto scaling group will try to change the running instances to match the desired capacity
* Default Cooldown: the interval between the successful scaling event
* Health Check Type:
  * EC2: instance status
  * ELB: use the health check logic of alb or elb
* ELB will take some time to drain instance(scale in), the default draining time is 300 secs
  * Draining for CLB
  * Deregistration delay in ALB

## Scaling Policies
> based on eithor metrics that monitored or the scheduled action to scale in/out

Types: 
* Simple scaling policy: Scale via the certain alarmed metrics
* Target tracking scaling policy

## Reference
* [Must Read FAQ](https://aws.amazon.com/ec2/autoscaling/faqs/)
* [Instance scale in policy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html)