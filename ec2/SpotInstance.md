# Spot Instance
* USE **Spot Block** to stop spot instances from being terminated even if price goes over user' bid price.
* Suitable tasks(can be terminated) for spot instance
  * Big data and analytics
  * Containerized workloads
  * CI/CD and testing
  * web services
  * image and media rendering
  * high-performance computing
* Not recommendation job to use spot instances
  * persistent workloads
  * critical jobs
  * database

# Spot Fleet
> A collection of Spot Instances and, optionally On-Demand Instances.

* It is used to launch the number of Spot Instances and On-Demand Instances to meet the target capacity user specified in the Spot Fleet request.
* Try and match the target capacity with users' price restraints
  1. Set up different launch pool. Define things like **EC2** instance type, operating system and Availavility Zone
  2. Allow to have multiple pools, and the fleet will choose the best way to implement depending on the strategy you define.
  3. Fleets will **stop launch instances** once you reach your price threshold or capacity desire.

## Spot Feet Strategy
* capacityOptimized: the spot instances come from the pool with optimal capacity for the number of instances launching.
* lowestPrice(default): the spot instacnes com from the pool with the lowest price.
* diversified: the spot instances are distributed **across all pools**
* instancePoolsToUseCount: the spot instances are distributed across the number of **pools you specified**. this parameter is valid only when useed in combination with *lowestPrice*.