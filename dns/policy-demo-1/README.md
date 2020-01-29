# Routing Policy
> Define how Route53 handle the request

## Simple Routing Policy
* Allo multivalue in the single record.
* Return in a **random order** if users request.
* Can only have a simple routing policy record with the same name.

**PROS**: Simple, the default, event spread of request  
**CONS**: Not load balacing, no performance control, no failover and health check, for alias type  - only a single AWS resource

## Failover Routing Policy
* Have the ability to fail over from primary record types to secondary record types
* Allow to define additional failover routing record with the same name.
  * Allow only single primary and single secondary record type

## Weighted Routing Policy
* Implement some form of leveling accross different resources
* Control amount of traffic that reach specific resources(e.g. A/B testing)
* Use the total of weight to determine the percentage of time that these records are return to the clients
  * Based on the ratio of the weight to the total weight
* Allow to create **multiple records** with the same record name
* Use for testing new feature of the application, but **not use** it to do the load balancing

## Latency Routing Policy
> Allow client to be matched to resources with the lowest latency

* Users can set the destination **region** to evaluate the latency
* Route53 evaluate the latency between agent(browsers) and destination region
* Not only based on geolocation but latency, it's not all about distance

## Geolocation Routing Policy
* Only return the record match the record name and **particular location**
  * If location isn't match, route 53 will not find the nearest location to return
  * If many location is match, route53 will return the highest priority location
* Can set the different granularity of different granularity
* This location is the **source** location

## Multivalue Answer Routing Policy
* Like simple routing policy but allow to create multiple records with the same name
* Allow to health check to each record

## Note
* S3 Alias: the name of the resource record for your S3 website endpoint **matches the name of your S3 bucket**
* SetID: should be unique between the records with the same name