#!/bin/bash

aws sqs get-queue-attributes --queue-url https://URL --attribute-names All
aws sqs send-message --queue-url https://URL --message-body "INSERTMESSAGE"
aws sqs receive-message --queue-url https://URL
aws sqs delete-message --queue-url https://URL --receipt-handle "INSERTHANDLE"
aws sqs receive-message --wait-time-seconds 10 --max-number-of-messages 10 --queue-url https://URL
aws sqs --region us-east-1 receive-message --wait-time-seconds 10 --max-number-of-messages 10 --queue-url https://URL
aws sqs delete-message --queue-url https://URL --receipt-handle "INSERTHANDLE"
