# Database

## Database Management System(DBMS)
### Relational
* Data has strong and known relationship
* Can use [normalization](https://en.wikipedia.org/wiki/Database_normalization) to reduce data redundant and dulication
* Have to predefine the data schema(structure)
* Issues
  * Hard to handle the data with fluid relationship
  * Data Schema is hard to scale

### Non-Relational([NoSQL](https://database.guide/nosql-database-types/))
#### Engine Type
* Key-Value Database: DynamoDB
  * non-structured data
* Document Database: MongoDB, Amazon Document DB
  * semi-structured data
* Column Based Database: Redshift 
  * Rather than row based like relational database
  * Data warehouse and analytics
* Graph database: Neo4j, AWS Neptune
  * dynamic relationship
  * relationship is important than data itself

## Reference
