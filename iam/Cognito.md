# Cognito
> Provide authentication, authorization and user management for **web and mobile apps**. Users can sign in through Aamzon Cognito or federate through a third-party idnetity provider.

* Not underneath the IAM service umbrella
* Allow users to authenticate with a Web Identity Provider(Google, Facebook, Amazon...)
* User authenticate with Web Identity Provider and recieve authentication token, which is exchanged for temporary AWS credentials vis Security Token Service(sts)
* Cognito is an **Identity Broker** which handles interaction between your application and the Web ID Provider
  * Provide sign-up, sign-in and guest user access
  * Sync user data for a seamless experience across devices
  * Recommended approach for Web ID federation particulary for mobile apps