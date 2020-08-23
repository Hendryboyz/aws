# Caching
> Cache is a balancing act between **up-to-date, accurate information** and **latency**. We can use the following services to **cache to AWS**
* Cloud Front
* API Gateway
* Elastic cache - Memcached and Redis
* DynamoDB Accelerator (DAX)

## Elastic Cache
> Full managed, in-memory cache engine used to imporvie database performance by caching results of queries that are made to a database
* Operate outside the DynamoDB, and want to improve the read performance.
* Key value store

### Caching Engine
* Redis
  * Supports more complex data structures
  * Supports master/slave replication and multi-az for cross AZ redundancy
* Memcached
  * Multi-threaded
  * No Multi-AZ capability

### Usecase
* offloading database read by cachine db response and improve performance(performance enhancing)
* store user session for the stateless compute instances(fault-tolerant architectures)
* Allow for managing web sessions, and also caching dynamically generated data
* Sits between your application and database(if database is particularly **read-heavy** but the data isn't changing frequently)
* Imporve performance for read-heavy workloads
  * Social Networking , gaming media sharing and Q&A portals
* Good for compute heavy workloads
* Be used to store results of I/O intensive database queries or output of compute-intensive calculations

### Caching Strategies
* Lazy Loading
  - wirte data to the cache when a cache miss occurs
  - avoid filling up the cache with that won't be requested
  - Data in the cache can become stale if lazy loading is implemented without outher strategies
  - DAX(DynamoDB Accelerator) only support Lazy Loading
  - use TTL to avoid stale data
  - read penalty
* Write Through
  - the cache is updated whenever a new write or update is made to the underlying database
  - Allow cache data to remain up-to-date(never stale)
    * wasted resources if most of the data is never used
  - Can add wait time to write operations in your applications
  - Without a TTL can result in a lot of cached data that is never read(Wasted resources if most of data is never read)
  - write penalty: each write involves a write to the cache
* Addint Time to Live(TTL)
  - Drawbacks to lazy loading and write through techniques can be helped by a TTL
  - TTL is the length of time before a key expires
  - Checks the value in the underlying database when reading an expired key
  - NOT garuntee fresh information, but they keep the data from getting too stale and allow the cache to clean up unused keys
 