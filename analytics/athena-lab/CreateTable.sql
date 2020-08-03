CREATE EXTERNAL TABLE IF NOT EXISTS aws_service_logs.cf_access_optimized (
  `time` timestamp,
  `location` string,
  `bytes` bigint,
  `requestip` string,
  `method` string,
  `host` string,
  `uri` string,
  `status` int,
  `referrer` string,
  `useragent` string,
  `querystring` string,
  `cookie` string,
  `resulttype` string,
  `requestid` string,
  `hostheader` string,
  `requestprotocol` string,
  `requestbytes` bigint,
  `timetaken` double,
  `xforwardedfor` string,
  `sslprotocol` string,
  `sslcipher` string,
  `responseresulttype` string,
  `httpversion` string 
) PARTITIONED BY (
  year string,
  month string,
  day string 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://cfst-1918-78db0f6a55e3ed0e49253724a761d8-s3bucket-2cy62xrqqsfc/'
TBLPROPERTIES ('has_encrypted_data'='false');