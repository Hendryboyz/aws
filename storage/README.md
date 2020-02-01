# Simple Storage Service
## Permissions
* bucket only allow the account that creates the bucket to use it and retrieve data
* by default, the bucket doesn't trust any other account
* be default, the bucket doesn't allow public access
* authorization is controlled using identity policies on aws, bucket policies in the bucket and the object access control list

### Block public access
another layer of protection, it will default block all of the access.

* on the top of any existing setting as a protection
* deny all public access ranted to a bucket and objects using ACLs and bucket policies(exclude identity policy)
* **IMPORTANT**: block public access overrules any other public grant


### Identity Policies
users, groups and roles(identites) can be given the permission to access s3 using identity policies

### Bucket Policies
resource policies can be given the account that users don't control. in the s3, resource polices call bucket policies
* Priority
  * Explicit Deny
  * Explicit Allow
  * Implicit Deny

### Access Control Lists
* no longer recommended by AWS
* ACLs the only way to grant security permission to the object level

### Refernce
* [Must Read - Controlling Access to S3 Resources](https://aws.amazon.com/blogs/security/iam-policies-and-bucket-policies-and-acls-oh-my-controlling-access-to-s3-resources/)

## Upload to S3
### Data Consistency Model
* read-after-write consistency for PUTS of new objects in your S3 bucket in all Regions
* eventual consistency for overwrite PUTS and DELETES in all Regions

### Single PUT upload
* Maximum 5GBs
* If data near 5GBs, there will be some performance issue
* Single stream if part of the upload fails then whole upload fails

### Multipart upload
* Broken individual objects up into smaller parts
* Parts up to 10000 parts
* Each part is 5MB to 5GB, last part can be less
* Recommends multipart upload for **anything over 100MB**, but it's required for anything beyond 5GB
* Allow to retry individual part of multi-part upload

## Object Encryption

* **SSL encrypt** the data in transit between client and S3
* Encrypt at rest
  * Client-Side Encryption: Application take the responsibility to encryption ,decryption and the key(strict security concern)
  * Server-Side Encryption with Customer-Managed Keys(SSE-C): user provide the key to s3 and s3 encrypt the data. Users manage the encryption key.
  * Server-Side Encryption with S3-Managed Keys(SSE-S3): S3 generate the keys. keys are stored with objects in an encrypted form. Objects are encrypted using **AES-256**
  * Server-Side Encryption with KMS-Managed Keys(SSE-KMS): KMS generate the keys.
    * Decryption of an object needs both S3 and KMS key permission(role seperation)
    * Seperate the permission of s3 and encryption key
  * Bucket policy can enfore encryption type, see [reference](https://aws.amazon.com/blogs/security/how-to-prevent-uploads-of-unencrypted-objects-to-amazon-s3/)

## Static Website Hosting
> S3 can be configured to host fron-end serverless applications.

* Pair with cloud front to deliver the content more quickly and efficiently, global user to access the content
* By default, all objects are private only, so if users want to open static webhosting features: 
  * Remove Block public access setting
  * Make public by using bicket policy or object ACLs
* Making object public will set the ACL to that object
* Allow bucket name to be the real DNS Name

### Cross-Origin Resource Sharing(CORS)
[CORS](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html) is a security measure to allow a web application running in one domain to **reference resources in another domain**. Cross-Origin = Cross Domain

## Object Versioning
* By default, not open object version
* After verioning enable, it only can be suspended. NOT allow to disable.
* Object will have a version id
* ACLs is based on per version
* Every version of object will be billed
* Delete version object will only add a deleted marker. User can delete the delete marker to recover the deleted object.
* Delete every version of object including delete marker can delete the whole object permanently
* MFA delete: to delete the object, enforce users need to have MFA token associated with IAM user and supply one time generated code

### Reference
* [Deleting Object Versioning](https://docs.aws.amazon.com/AmazonS3/latest/dev/DeletingObjectVersions.html)
* [Using MFA Delete](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMFADelete.html)

## Pre-signed URL
> Pre-signed URL can be created by identity(users, groups or roles) inside AWS providing access to an object **using creator's access permission**.

* Have the expiring time let users can access pre-signed URL temporarily
* Allow to create the pre-sign URL to the object users don't have permission, but the generated URL still can't access the object
* Presigned URL can used not only download but upload objects

# Advanced Properties
## Cross Region Replication
> **One way** replication of data from src bucket to dest bucket in different regions.

* Require version is enable in both src and dest bucket
* Allow to create replication with prefix or tag
* Have to provide a IAM role to replicate the object from src and deposit them to dest bucket
* Global resilience, backup and change storage class

Exception
* System Actions(lifecycle events)
* Any existing objects before replication is enabled
* SSE-C encrypted objects - only SSE-S3 and SSE-KMS encrypted objects are supported
  * Notice: KMS is regional basis

By default, replicated objects keep their
* Storage Class
* Object Name
* Owner
* Object permissions

Replication allow to change
* Storage Class
* Owner
