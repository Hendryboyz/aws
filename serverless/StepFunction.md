# Step Function 
* Full-managed service to coordinate components of your applications through individual steps
* Simple workfow service need to a ec2 to do the workflow but step function is serverless
  - used to help orchestrate and visualize application logic in serverless applications
* Amazon State Language define step function
* Be used to overcome the following cons of Lambda function: 
    * Lambda is stateless
    * Have maximum execution time limit

## Properties and Benefits
* Longer than 15 mins of execution(Lambda limit)
* Lambda coordination
* Coordination scalibility and highly reliable
* Visual Workflow
* Avoid coding large amounts of application logic by defining it in JSON state machine
* Reuse application components and edit workflow easily
* Easily integrates with AWS services like AWS Lambda

## Components
### Tasks
> Work in state machine is done by tasks. Tasks can be an activity or Lambda function.
* Activity
  - Program code that taks input and responds using Step Function API actions
  - Can hosted on EC2, ECS and even mobile devices
  - Interacts with Setp Functions using API Actions
* Lambda function
  - serverless functino that responds to state machine tasks
  - easily and directly integrated with Step functions
  - allow to be written in a variety of langurages

### State Machines
* Defined using the **JSON Amazon States Language**
* Types of states