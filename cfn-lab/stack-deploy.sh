#!/bin/bash
STACK_NAME=pls-eks3-psd-job
IS_STACK_EXISTING=$(aws cloudformation describe-stacks --stack-name $STACK_NAME 2> /dev/null) && echo true

if [ "$IS_STACK_EXISING" = true ]; then
  echo "Stack[$STACK_NAME] is existing. Start to update stack [$STACK_NAME]"
else
  # Create
  echo "Stack[$STACK_NAME] is not existing. Start to create stack [$STACK_NAME]"
  STACK_ARN=$(aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://queue-template.json | jq '.StackId' | sed -e 's/\"//g')
  echo $STACK_ARN
  
  # Wait for creation
  echo "Waiting Stack[$STACK_NAME] creation....."
  aws cloudformation wait stack-create-complete --stack-name $STACK_ARN
  
  # Describe stack status
  aws cloudformation describe-stacks --stack-name $STACK_NAME
  echo "Stack[$STACK_NAME] is created"
fi

## Use for demonstration, stack will be deleted after creation

# aws cloudformation delete-stack --stack-name $STACK_ARN
# aws cloudformation wait stack-delete-complete --stack-name $STACK_ARN