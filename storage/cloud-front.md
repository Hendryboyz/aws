# CloudFront
> Content Delivery Network(CDN) solution of AWS. Global Cache that stores copies of your data on edge caches, which are positioned as close to the customers as possible.

* Default Root Object: the default object return to users if users access cloud front without giving any sub path
* Origin fetch: if content isn't existing in the cache of edge location and regional cache. Content will be copied to edge location first and then copied to Regional Cache.
  * Edge location will request content from regional cache first.
  * Regional Cache isn't existing will cause origin fetch
* Alternative Domain Name allow users to provide the custom domain name, but users also have to provide the SSL certification as well.

Benefits: 
* Lower Latency
* Higher Transfer Speeds
* Reduce Load from the Origin Server

## Private Distribution
\>> Behavior >> Edit Default Behavior >> Enable Restrict Viewer Access
(Use Signed URLs or Signed Cookies)

* Trusted Signer means private distribution
* Have set s3 can only be accessed by CloudFront OAIs

## Components
* Origin: The server host the content
* Distribution: Configure all aspects of a specific implementation of CloudFront from
* Edge Location: local infrastructures that host caches of users data.(Price Class)
* Regional Edge Caches: Larger version of edge locations. Less of them but they have more capability and can serve larger areas.

## Type
* Web: Static and dynamic content for browsers
* RTMP: using Adobe Flash Media Server's RTMP Protocol(Adobe Realtime messaging protocol)

## Origin Access Identity(OAI)
> Virtual Identities associate with one/more distributions and can be used in bucket policies to restrict the access.

* Only allow to use in S3
* OAIs is not used to configure private viewing within CloudFront. Trusted signer help to configure CloudFront for private distribution.

## Reference
* [CloudFront Document](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)
* [S3 Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html)