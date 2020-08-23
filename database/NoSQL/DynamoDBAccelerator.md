# DynamoDB Accelerator
> In memory caching **eventually consistent** reads for items and query results and reduces the latency from single-digit milliseconds to **microseconds**.

* faster read milliseconds to microseconds but optimize read table first
  * 10x performance improvement
* improve **eventuallly consistent** reads only
* point the api call to DAX instead of DynamoDB table
* **DO NOT** use DAX if application **require strongly consistent** reads or write-intensive application
* Applications that read a small number of items much more frequently
* Cache hit: First return from DynamoDB, and second return from DAX(like Content Delivery Network)
* Offload some read workload to DAX
* Prevent over provision the capacity to reduce the cost
* Usually pair with auto scaling
* DAX is a memcache cluster run in the VPC
* **ONLY SUPPORT** write through strategy and not support lazy loading 
  * enable DAX for DynamoDB should consider the write penalty

## Cache
* Item Cache: Cache the result of GetItem and BatchGetItem and has a default 5 minutes TTL
* Query Cache: Cache the result of query and scan operations
*  Write througth cache, DAX can be used to improve write performance

## Usecases
* require the fastest possible response time for reads
* read a small number of items more frequently than others
* are read-intensive, but are also cost-sensitive
* required repeated reads against a large set of data