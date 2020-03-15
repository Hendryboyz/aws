# Elastic Cache
> Full managed, in-memory cache engine used to imporvie database performance by caching results of queries that are made to a database
* Operate outside the DynamoDB, and want to improve the read performance.
* Key value store

## Caching Engine
* Redis
* Memcached

## Usecase
* offloading database read by cachine db response and improve performance(performance enhancing)
* store user session for the stateless compute instances(fault-tolerant architectures)
* Allow for managing web sessions, and also caching dynamically generated data

## Caching Strategies
* Lazy Loading
  - wirte data to the cache when a cache miss occurs
  - avoid filling up the cache with that won't be requested
  - Data in the cache can become stale if lazy loading is implemented without outher strategies
* Write Through
  - the cache is updated whenever a new write or update is made to the underlying database
  - Allow cache data to remain up-to-date
  - Can add wait time to write operations in your applications
  - Without a TTL can result in a lot of cached data that is never read
* Addint Time to Live(TTL)
  - Drawbacks to lazy loading and write through techniques can be helped by a TTL
  - TTL is the length of time before a key expires
  - Checks the value in the underlying database when reading an expired key
  - NOT garuntee fresh information, but they keep the data from getting too stale and allow the cache to clean up unused keys
 