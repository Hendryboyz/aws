import boto3
import json
import os
import decimal

SFN_ARN = 'arn:aws:states:us-east-1:109821121799:stateMachine:reminder'

sfn = boto3.client('stepfunctions')

def lambda_handler(event, context):
    print('EVENT: ')
    print(event)

    data = json.loads(event['body'])
    data['waitSeconds'] = int(data['waitSeconds'])
    
    checks = []
    checks.append('waitSeconds' in data)
    checks.append(type(data['waitSeconds']) == int)
    checks.append('preference' in data)
    checks.append('message' in data)
    if data.get('preference') == 'sms':
        checks.append('phone' in data)
    if data.get('preference') == 'ses':
        checks.append('email' in data)

    if False in checks:
        response = {
            'statusCode': 400,
            'headers': {'Access-Control-Allow-Origin': '*'},
            'body': json.dumps(
                {
                    'Status': 'Success',
                    'Reason': 'Input failed validation'
                },
                cls=DecimalEncoder
            )
        }
    else:
        sfn.start_execution(
            stateMachineArn=SFN_ARN,
            input=json.dumps(data, cls=DecimalEncoder)
        )
        response = {
            'statusCode': 200,
            'headers': {'Access-Control-Allow-Origin': '*'},
            'body': json.dumps(
                {'Status': 'Success'},
                cls=DecimalEncoder
            )
        }
    return response

class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            return int(obj)
        return super(DecimalEncoder, self).default(obj)