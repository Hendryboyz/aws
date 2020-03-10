import boto3

dynamodb = boto3.client('dynamodb')

print('Conditional Write:')
response = dynamodb.update_item(
  TableName='Music',
  Key={
    'Artist': {'S': 'Anthony Haslett'},
    'SongTitle': {'S': 'Blue Magenta'}
  },
  UpdateExpression='SET price = :val',
  ExpressionAttributeValues={
    ':val': {'N': '15.37'},
    ':curval': {'N': '18.37'}
  },
  ConditionExpression='price = :curval',
  ReturnValues='ALL_NEW'
)
