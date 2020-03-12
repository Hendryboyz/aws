#!/bin/bash

aws lambda create-function --function-name ProcessDynamoDBRecords \
  --zip-file file://function.zip \
  --handler index.handler \
  --runtime nodejs8.10 \
  --role <execution-role-arn>

aws lambda invoke --function-name ProcessDynamoDBRecords \
  --payload file://input.json outputfile.txt

aws lambda create-event-source-mapping --function-name ProcessDynamoDBRecords \
  --batch-size 100 \
  --starting-position LATEST \
  --event-source <dynamodb-stream-arn>
 