#!/bin/bash

# use --page-size option to have the CLI request a smaller number of items from each API call
# cli still retrieves the full list but performs a larger number API calls in the background
# and retrieves a smaller number of items with each call
aws s3api list-objects --bucket henry-bucket --page-size 100

# only retrieve the number of items in value of --max-items
aws s3api list-objects --bucket henry-bucket --max-items 100