## Goal
* Directory to add examples about `run.module`

## How to run?
* `terraform init`
* `terraform test`

## Structure
* 'main.tf'
  * trust in the previous existence of a 'aws_s3_bucket'
* '/tests/setup/main.tf'
  * create the infrastructure resource 'aws_s3_bucket'
* 