aws kms create-key --description "description"
aws kms create-alias --target-key-id <key-id> --alias-name "alias/lakmsdemo"
aws kms encrypt --key-id <key-id> --plaintext file://topsecret.txt --output text --query CiphertextBlob
aws kms encrypt --key-id <key-id> --plaintext file://topsecret.txt --output text --query CiphertextBlob > topsecret.base64.encrypted
aws kms encrypt --key-id <key-id> --plaintext file://topsecret.txt --output text --query CiphertextBlob | base64 --decode > topsecret.encrypted
aws kms decrypt --ciphertext-blob fileb://topsecret.encrypt --output text --query Plaintext | base64 --decode


# using data encryption key
aws kms generate-data-key --key-id <key-id> --key-spec AES_256