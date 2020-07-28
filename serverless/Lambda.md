# Lambda
> The Function as a Service solution in AWS, allow users to run the code without provisioning or managing servers

* Only be billed for function execution
  - pay only for the compute time you consume - don't pay for idle time
* Funcion allow to be executed up to 15 minutes. If longer, user should consider **step function**
* 100ms is the minimum billing time for lambda function
* By default, a stateless service and it always launch in a new clean environments
* By default, Lambda is highly available, fault tolerant, scalable, elastic and cost-efficient

## Terminology
* Function Name: Should be unique in user's account per region
* Runtime: the compiler/environment to run the code
* Execution Role: the IAM role to request the permission to sts for Lambda function(3.2 millions ms for free tiers)

## Lambda functions or Lambda function packages
The core concept when programming and it consist of
* Your apolication code
* Any application dependencies your code requires, such as libraries, configuration or other dependencies

### Lambda function packages
> function packages or deployment packages are zip packages of all the **code and depedencies** required by your lambda function whent it runs.
Function packages include;
* handler file
* custom libraries and packages
* other application code that integrates with your handler
* third-party packages from providers like npm or pip that your function requires

### Programming Model
All AWS Lmabda language runtimes deal with similar concepts including:
* Handler files and functions: the entry point for Lambda invocations(handler_filename.function_name)
* Events
* Context: a way to get runtime information
* Logging and Exception
* Runtime-specific concepts

### Invocation Types
> When invoking directly with the *Lambda Invoke API*, pick an invocation type
* Synchronous: wait for the return value
* Aysnchronous: don't wait for the return value

## Lambda events
Events are used to trigger AWS Lambda. These events can be a variety of things including:
* HTTP API requests through API Gateway
* Cloudwatch schedules events
* S3 file uploads
* DynamoDB Streams changes
* Direct invocations using the CLI or SKDs
* others

## Lambda Configuration
* Support languages run times:
  - Node.js
  - Java
  - C#
  - Go
  - Python
* The handler
  - Each Lambda function has a handler file and function
  - Format of the Lambda handler value is handler_filename.function_name
* Memory
  - 128MB - 3008MB(64MB increments)
  - CPU allcation scale with memory
* Maximum execution durations: 15 mins(1 second increment)
* Permissions
  - IAM Role: grant the function permissions to take actions on other AWS resources
  - Resource-based access control policies: allow other services and external accounts to invoke or take other actions on a Lambda function(e.g. API gateway send traffic to Lambda)
* Environment Variables
* AWS Virtual Private Cloud: Grant your function access to VPC resources
* Dead Letter Queues: configure SQS or SNS to accept data from failed function executions
* Concurrency: the maximum number of concurrent invocations of your function
  - Reserved account concurency is 1000 per account per region
  - TooManyRequestsException(HTTP Status Code: 429)
* Reserved concurrency guarantees a set number of concurrent executions are always available to a critical function
* Tags: Key-value pairs to help organize functions
* Limit reference: https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html

## Lambda Version and Alias
> Used to manage your production function code

### Versions
* Distinct versions of your functions stored inside of AWS each with their own unique ARNs
* Versions are either:
  - $LATEST: ONLY mutable and changealbe version
  - Number version:immutable and each subsequent version is incremented by one(starting by 1)
  - Manage version for different environments effectively

### Alias
* A pointer to specific Lambda version
* Using aliases you can invoke a function with the alias without having to know which version of the function is being referenced
* Static ARNs but can point to any version of the same function
* Split traffic traffic between Lambda versions
  * Can NOT split traffic with $latest, instead create an alias to latest

### Benefits
* Easier deployment workflow and management of stages
* Avoid having to reconfigure event sources(point to Alias)
* Rolling back to an ealier version become as easy as updating the alias
* Using Alias traffic splitting between versions can also help test new version in production