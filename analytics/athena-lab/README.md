# Athena Lab
* Content Delivery Network logs have already stored in S3 in advanced.
* Use AWS Glue, ETL a.k.a External Transformation and Load Job to optimize the logs stored in S3 for AWS athena querying

## Step
1. Create the output bucket to store Athena query result
2. View primary workgroup >> Edit workgroup >> Query result location, select the bucket that is created from step 1
3. Query Editor >> Connect data source(right of Data source)
4. Query data in Amazon S3 + AWS Glue data catalog >> Add a table and enter schema information nanually
5. follow the guideline of Athena

## Colums
Bulk add column

```
time timestamp, location string, bytes bigint, requestip string, method string, host string, uri string, status int, referrer string, useragent string, querystring string, cookie string, resulttype string, requestid string, hostheader string, requestprotocol string, requestbytes bigint, timetaken double, xforwardedfor string, sslprotocol string, sslcipher string, responseresulttype string, httpversion string
```

## Additional Information
* AWS Glue format: https://parquet.apache.org/
* https://github.com/awslabs/athena-glue-service-logs/blob/master/athena_glue_service_logs/cloudfront.py
* Athena Partitioning Data: https://docs.aws.amazon.com/athena/latest/ug/partitions.html
* Web Distribution Access Log: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html#BasicDistributionFileFormat