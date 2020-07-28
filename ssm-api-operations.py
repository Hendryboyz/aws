import boto3

ssm = boto3.client('ssm')
# GetParameter API
ssm.get_parameter(Name='mydbstringpass', WithDecryption=True)
ssm.get_parameter(Name='mydbstringpass', WithDecryption=False)

# PutParameter API
ssm.put_parameter(Name='test1', Description='our second test', Value='our-super-super-secret-password', Type='SecureString')
