# Key Management Service
* **Regional** security key management
* FIPS 140-2 level 2 validated
* Allow users to create, modify and delete customer master keys
* Handle up to 4KB file
* Only allow to access CMKs with KMS, not allow to access directly
* Allow key rotation my setting
* Allow to use a new key to **re-encrypt** the data and it don't see the plain text 
* Using CMK to generate a data encryption key allow users to encrypt or decryt data in any size

## AWS Managed CMK
* Like S3 managed customer master key

## Customer Managed CMK
* Allow key rotation configuration
* Manage the permission of key via key policies
* Enable/Disable Key

## Data encryption key
* Using CMK to get
  * Data encryption key
  * Encrypted Data encryption Key
* Use Data encryption key to encrypt any size of data and store it with encrypted data encryption key
* Use KMS key policy to give identity permision to access decrypt encrypted dek
* Using the dek to decrypt the encrypted data