# DynamoDB Accelerator
> In memory caching **eventually consistent** reads for items and query results and reduces the latency from single-digit milliseconds to microseconds.

* faster read milliseconds to microseconds but optimize read table first
* **DO NOT** use DAX if application require strongly consistent reads
* Applications that read a small number of items much more frequently
* Cache hit: First return from DynamoDB, and second return from DAX(like Content Delivery Network)

## Cache
* Item Cache: Cache the result of GetItem and BatchGetItem and has a default 5 minutes TTL
* Query Cache: Cache the result of query and scan operations