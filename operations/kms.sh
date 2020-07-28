aws kms create-key --description "description"
aws kms create-alias --target-key-id <key-id> --alias-name "alias/lakmsdemo"
aws kms encrypt --key-id <key-id> --plaintext file://topsecret.txt --output text --query CiphertextBlob
aws kms encrypt --key-id <key-id> --plaintext file://topsecret.txt --output text --query CiphertextBlob > topsecret.base64.encrypted
aws kms encrypt --key-id <key-id> --plaintext file://topsecret.txt --output text --query CiphertextBlob | base64 --decode > topsecret.encrypted
aws kms decrypt --ciphertext-blob fileb://topsecret.encrypt --output text --query Plaintext | base64 --decode


# using data encryption key
aws kms generate-data-key --key-id <key-id> --key-spec AES_256

# A Cloud Guru KMS Lab
aws kms encrypt --key-id <key_id> \
  --plaintext fileb://<plaintext_file_name> \
  --output text \
  --query CiphertextBlob | base64 --decode
aws decrypt --ciphertext-blob fileb://<ciphertext_file_name> \
  --output text \
  --query Plaintext | base64 --decode
# Allow to re-encrypt the contents and don't need to expose the plain text value
aws kms re-encrypt --destination-key-id <re-encrypted_key_id> \
  --ciphertext-blob fileb://<ciphertext_file_name> | base64 --decode
# Rotation the key per year basis
aws kms enable-key-rotation --key-id <key_id>