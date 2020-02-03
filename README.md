# Amazon Web Service Note

## Amazon Resouce Name
### Format
* arn:partition:service:region:account-id:resource-id
* arn:partition:service:region:account-id:resource-type/resource-id
* arn:partition:service:region:account-id:resource-type:resource-id

# Identity Federation
* SAML2 send SAML assertion to AWS Assertion Consumer Service to get the
## Enterprise Access to AWS Resources
* SSO across all enterprise systems including AWS
* Potentially tens or hundreds of thousands of staff/users - more than IAM can handle(5000)

## Mobile and Web Applications
* Application require to access to AWS resources
* Don't manage credentials within  the application
* Support other credentials with Cognito - Google, Twitter, Facebook, etc

## Centralize Identity Management(AWS Accounts)
* Tens of hundreds of AWS account in an organization
* Role switching used from an ID account into member accounts.
