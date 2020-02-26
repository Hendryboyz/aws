# OpsWorks
> Infrastructure management service within AWS. Based on the Chef configuration management and deployment platform.

## Components
* Layers
  * Like the application tiers within a stack
  * Allow to apply recipes
  * Resource put in the layer(computing resources: instances)
* Instances
  * EC2 instances associated with a layer
* Apps
  * Allow to deploy to one or more layers
* Recipes
  * Setup
  * Configure: execute on all instances in the layer(when add or remove instances)
  * Deploy/Undeploy: execute when **application** are added or removed to the layer
  * Shutdown: execute when an instance is shutdown but before it's stopped

## Reference
* [Chef Quick Start](https://docs.chef.io/quick_start.html)
* [Chef Cookbooks](https://docs.chef.io/cookbooks.html)
* [OpsWork Stacks](https://docs.aws.amazon.com/opsworks/latest/userguide/welcome_classic.html)

Note: Chef > recepies > cookbook