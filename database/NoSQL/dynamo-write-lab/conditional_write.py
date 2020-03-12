import boto3

dynamodb = boto3.client('dynamodb')

print('Conditional Write:')
response = dynamodb.update_item(
  TableName='MusicAlley',
  Key={
    'Artist': {'S': 'Anthony Haslett'},
    'SongTitle': {'S': 'Blue Magenta'}
  },
  UpdateExpression='SET price = :val',
  ExpressionAttributeValues={
    ':val': {'N': '15.37'},
    ':currval': {'N': '1.2345'}
  },
  ConditionExpression='price = :currval',
  ReturnValues='ALL_NEW'
)