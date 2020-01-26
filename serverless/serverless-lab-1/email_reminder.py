import boto3

VERIFIED_EMAIL = 'Hendry.js1247@gmail.com'

ses = boto3.client('ses')

def lambda_handler(event, context):
    ses.send_email(
        Source=VERIFIED_EMAIL,
        Destination={
            'ToAddresses': [event['email']]
        },
        Message={
            'Subject': {'Data': 'A reminder from your reminder service!'},
            'Body': {'Text': {'Data': event['message']}}
        }
    )
    return 'Success!'