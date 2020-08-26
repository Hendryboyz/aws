# IAM
## Identity
* IAM User
* IAM Role  

Note: IAM Group isn't a truely identity because it can't be used to authenticate a principle 

## IAM User
Use customer managed policy in baseline permission  
Use inline policy(maximum 2048 character) to handle exception policy

AWS recommend user rotate their access key regularly, so they provide maximum 2 access keys in each IAM user.  
**Rotate Steps**
1. Create the new access key
2. Substitute the old access key in service/command line with new one
3. Disable old access key, and check if any services fail to authenticate and authorize
4. Delete the old access key


## IAM Role
* Trust Policy: Define who can assume this role
* Permission Policy: Define what service can be used by trust policy
* Security Token Serivce(STS): generate temporary credentials to trust policy

**Antipattern**
* identity that have a require to login

**Best Practice**
* identity need a temporary permission

## Amazon Inspector
> Automated security assessment service to test the network accessiblity of Amazon EC2 instances and the security state of your applications running on the instances.

## IAM Policy
* JSON format document defines permissions
* No effect until attached
* policy is a **List of Statements**
    * Each statement matches an **AWS API request**
    * AWS API Request is **any action users can perform** in AWS
* Inline policy limit the permission of the policy in the scope of the IAM resources(users, groups or roles)

``` Json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow/Deny",
            "Action": "api-call",
            "Resource": ["arn:aws:..."]
        },
        {
            "Effect": "Allow/Deny",
            "Action": "api-call",
            "Resource": ["arn:aws:..."]
        }
    ]
}
```

###  Identity Policy
* attach to users, group and roles

### Resource policy
* attach to resource(s3, sqs queue and kms, etc.)

### Permission Boundaries
* Used to **delegate** adminstration to other users
* Prevent **privilege escalation** or **unnecessarily broad permissions**
  * set the maximum permissions that an identity based policy can grant to an IAM entity
* Control **Maximum** permissions an IAM policy can grant

### Tips
* Not explicitly allow = implicitly denied
* Explicitly denied > everything else
  * Deny supercedes allow
* Only attached policies have effect
* AWS joins all applicable policies

## Single Sign On
* Centrally manage access
* Example: G Suite, Office 365, SalesForce
* Use existing identities
  > using existing corporate identities to sign in AWS services or third party applications
* Account-level permissions
* SAML
  * Provide cross context authentication session