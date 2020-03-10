# DynamoDB Index
Users should know the access pattern of the table in advanced. But users can change the access pattern through the index.

## Local Secondary Index(LSI)
> Alternative view of a table's data using **the same partition key** but alternative sort key. Allow us to specify the alternative sort key.

* Share the RCUs and WCUs values for the main table.
* LSI is kept in sync with the base table automatically.
* Only allow to be created at the same time as creating a table
* Only work when table has a **composite primary key**(hash key + range key)
* Per table allow to have maximum 5 LSIs
* Can do strongly consistent reads on LSIs

## Global Secondary Index(GSI)
> Global Secondary Index allow data in a table to be presented using an alternative partition and sort key.

* Like using the new partition and sort key create a new table
* Allow to be created at any point after the table is created
* GSIs have their own RCU and WCU values, and allow to auto scaling. GSIs consume read and write capacity independently from the main table.
* Allow to create 20 GSIs per table. Can be increased by support tickets.
* Asynchonous copied the data from the main table, have some leg. GSIs doesn't allow to perform strongly consistent reads
* Can NOT do strongly consistent reads on GSIs

## Proejction
> Can use to improve read performance by projecting less data, but if you take the non-projected attributes, it will cause huge performance penalty because it have fetch attributes from the main table.

* All
* Keys only
* Include: only take small amount of data to the index