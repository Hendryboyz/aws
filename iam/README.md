## IAM
AWS recommend user rotate their access key regularly, so they provide maximum 2 access keys in each IAM user.  
**Rotate Steps**
1. Create the new access key
2. Substitute the old access key in service/command line with new one
3. Disable old access key, and check if any services fail to authenticate and authorize
4. Delete the old access key