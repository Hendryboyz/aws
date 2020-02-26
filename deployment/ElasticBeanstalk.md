# Elastic Beanstalk
* Platform as a Service
* Low level infrastrucutre control
  * Minimum admin overhead
* Require to design the code for Beanstalk
* Developer should know more about Elastic Beanstalk

## Components
* Application: the container with an actual version of application code
* Environment: application allow to own multiple environments
  * Environment live in Application Container
* ApplicationVersion: a distinct version of the application code that packaged into a source bundle
  * Application Version deploy to the Environment

## Deployment Options
* All at Once: deploy the application version to instances inside an environment at the same time
* Rolling: Split instances into batches and deploys one batch at a time
* Rolling with additional batch: using new batch, deploying testing before removing the old batch(have to pay for the instances in the additional new batches)
* Blue/Green: Maintain two environments, deploy and swap CNAME