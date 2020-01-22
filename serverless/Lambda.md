# Lambda
> The Function as a Service solution in AWS

* Only be billed for function execution
* Funcion allow to be executed up to 15 minutes. If longer, user should consider **step function**
* 100ms is the minimum billing time for lambda function
* By default, a stateless service and it always launch in a new clean environments

## Terminology
* Function Name: Should be unique in user's account per region
* Runtime: the compiler/environment to run the code
* Execution Role: the IAM role to request the permission to sts for Lambda function(3.2 millions ms for free tiers)

## Code define the function
* Upload the zip or s3 file if users want to import extenral library
