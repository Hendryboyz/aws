import boto3

kms = boto3.client('kms', region_name='us-east-1')
key_id = 'alias/my-key'
database_password = 'my-database-password'
result = kms.encrypt(KeyId=key_id, Plaintext=database_password)
encrypted_password = result['CiphertextBlob']
decrypted_result = kms.decrypt(CiphertextBlob=encrypted_password)
decrypted_password = decrypted_result['Plaintext']