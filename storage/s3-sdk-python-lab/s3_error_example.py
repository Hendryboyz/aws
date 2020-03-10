import boto3

s3 = boto3.resource('s3')

def try_to_get_object(bucket, key):
  try:
    obj = s3.Object(bucket, key)
    return obj.get()['Body'].read().decode('utf-8')
  except Exception as e:
    print('Error:')
    print(e)

# Access denied error
no_access_bucket = 'www.fernandomc.com'
no_access_key = 'index.html'
try_to_get_object(no_access_bucket, no_access_key)
# Error: An error occurred (AccessDenied) when calling the GetObject operation: Access Denied

# No such key
existing_bucket = 'the-la-cda-henry-s3-bucket'
# fake_key = 'something.something.not.real'
fake_key = 'ourtest.txt'
try_to_get_object(existing_bucket, fake_key)
# Error: An error occurred (NoSuchKey) when calling the GetObject operation: The specified key does not exist.

# No such bucket
imaginary_bucket = 'please.dont.make.this.a.real.bucket.or.the.example.will.fail'
imaginary_bucket_key = 'something.something.not.reale'
try_to_get_object(imaginary_bucket, imaginary_bucket_key)
# Error: An error occurred (NoSuchBucket) when calling the GetObject operation: The specified bucket does not exist

# Invalid bucket name
invalid_bucket_name = '<!Mycoolbucketnamethatwontwork!>'
invalid_bucket_key = 'somefilename'
try_to_get_object(invalid_bucket_name, invalid_bucket_key)
# Error:
# Parameter validation failed:
# Invalid bucket name "<!Mycoolbucketnamethatwontwork!>": Bucket name must match the regex "^[a-zA-Z0-9.\-_]{1,255}$" or be an ARN matching the regex "^arn:(aws).*:s3:[a-z\-0-9]+:[0-9]{12}:accesspoint[/:][a-zA-Z0-9\-]{1,63}$"

# https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html