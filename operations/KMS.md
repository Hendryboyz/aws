# Key Management Service
* **Regional** security key management
* FIPS 140-2 **level 2** validated and Level 3 is Cloud HSM
* Allow users to create, modify and delete customer master keys
* Handle up to **4KB** file
* Only allow to access CMKs with KMS, not allow to access directly
* Allow key rotation my setting
* Pay per API call 
* Allow to use a new key to **re-encrypt** the data and it don't see the plain text 
* Using customer master keys(CMKs) to generate a data encryption key allow users to encrypt or decryt data in any size
* Audit capacity using CloudTrail - logs delivered to S3
* Encrypted data contain the CMK which used to encrypt data. Decryption process **don't require to specify** the CMK the encryption data is used

## AWS Managed CMK
* Like S3 managed customer master key
* Rotate by AWS every 3 years

## Customer Managed CMK
* Allow key rotation configuration every 1 year
* Manage the permission of key via key policies
* Enable/Disable Key

## Data encryption key
* Use encrypt data **larger than 4 KBs**  
* Using CMK to get
  * Data encryption key
  * Encrypted Data encryption Key
* Use Data encryption key to encrypt any size of data and store it with encrypted data encryption key
* Use KMS key policy to give identity permision to access decrypt encrypted dek
* Using the dek to decrypt the encrypted data
* Envelope encryption

## Ecnryption
### Symmetric
* **Same key** used for encryption and decryption
* **AES-256**
* Never leaves AWS unencrypted
* Must call the KMS APIs to use
* AWS services integrated with KMS use symmetric CMKs
* Encrypt, decrypt and re-encrypt data
* Generate data keys, data key pairs and random byte strings
* **import** your own key material

### Asymmetric
* Mathematically related **public/private** key
  * public can provide to the trusted users
* **RSA** and **elliptic-curve cryptography(ECC)**
* **Private** key never leaves AWS unencrypted
* Must call the KMS APIs to use **private** key
* **Download** the public key and use outside AWS
* Used outside AWS by users who can't call KMS APIs
* AWS services integrated with KMS **DO NOT SUPPORT** asymmetric CMKs
* Sign messages and verify signatures

# Cloud HSM
* Dedicated hardware security module (HSM)
* FIPS 140-2 Level 3
* Manage your own keys
* **No access** to the AWS-managed component
* Runs within a VPC in your accoun
* Single tenant, dedicated hardware, multi-AZ cluster
* Industry-standard APIs - **no AWS APIs**
* Compliance to:
  * PKCS#11
  * Java Cryptography Extensions(JCE)
  * Microsoft CryptoNG(CNG)
* Keep your key safe - **irretrievable** if lost
