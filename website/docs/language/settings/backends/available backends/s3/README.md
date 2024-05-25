- allows
    - state — is stored as — S3’s key
    - state locking — via — DynamoDb
        - several state files can be locked / 1! DynamoDB table
- 
    ```
    terraform {
      backend “s3” {
        bucket = “S3BucketName”
        key = “PathInTheS3BucketToStoreIt”
        region = 
        dynamodb_table = “DynamoDBTableName”
        workspace_key_prefix = "PrefixAppliedToStatepath"
        encrypt = booleanToEnableServerSideEncryption
        …
    }
    ```
  - `S3BucketName` must pre-exist
  - `key`
    - if you use a non-default workspace → statePath = workspaceKeyPrefix/workspaceName/key
  - `workspace_key_prefix`
    - uses
      - non-default workspace
    - `env`
      - default workspace
  - `encrypt`
    - enable server side encryption
  - `dynamodb_table`
    - “LockID”
      - name of the partition key / type string
- TODO:

## Example
### Prerequisites
* Terraform v1.2+
* [AWS CLI installed locally](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* AWS account with [associated credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)
### How to run?
* `terraform init`
* `terraform apply`
  * Problems:
    * Problem1: "Failed to get existing workspaces: Unable to list objects in S3 bucket "mybucket" with prefix "env:/": operation error S3: ListObjectsV2"
      * Solution: Create the S3 bucket previously
    * Problem2: "operation error DynamoDB ... ResourceNotFoundException:"
      * Solution: Create the DynamoDB table previously
* `terraform init -migrate-state`
  * if you make a change in the backend configuration
  * Problems
    * Problem1: Why NO changes applied if you run `terraform apply`?
      * Solution: TODO:
### Notes
* Why NO information stored in the dynamoDb?
  * Solution: TODO: