- allows
    - producing custom error messages / different types of objects in a configuration
        - → make easier to comprehend errors
    - capturing assumptions
- types
  - Checks
    - Check '../Checks' 
  ```
    check “CheckName” {
      ...
      assert {
        condition = 
        error_message = "String"
      }
    }
  ```
  - variable's validation
    - allows
      - creating validation conditions for input variables
    - how does it work?
      - TODO:
      - if it’s false the condition → ⚠️blocked the runs ⚠️
    - TODO:
  ```
  variable “variableName” {
    ...
    validation {
      condition = 
      error_message = "String"
    }
  }
  ```
  - precondition & postcondition
    - uses
      - nested blocks for
        - resource's lifecycle
        - data source's lifecycle
        - output valus
    - how does it work?
      - TODO:
      - if it’s false the condition → ⚠️blocked the runs ⚠️
  ```
  precondition {
    condition = 
    error_message = "String" 
  }
  postcondition {
    condition = 
    error_message = "String" 
  }
  ```

- `condition`
  - := boolean Expressions
    - available values
      - if the Expressions is fulfilled → true
      - else -> false
    - — can refer to — lifecycle of any
      - `resource`
      - data source
      - variables
  - any functions can be used
  - `self`
    - := object /
      - allowed in `postcondition`
      - — refer to the — instance under evaluation
- `error_message`

## Examples
### Prerequisites
* Terraform [v1.7+](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed locally
* AWS account with [associated credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)
  * via
    * add in the 'provider' block
    * environment variables
      * 'AWS_ACCESS_KEY_ID'
      * 'AWS_SECRET_ACCESS_KEY'
      * 'AWS_REGION'
    * credential files
      * `aws config` & pass the 'AWS_ACCESS_KEY_ID' & 'AWS_SECRET_ACCESS_KEY'
### How to run?
* `terraform init`
* `terraform plan`
  * Problems:
    * Problem1: " Error: Invalid provider configuration. Provider "registry.terraform.io/hashicorp/aws" requires explicit configuration. Add a provider block to the root module"
      * Solution: Add `provider "aws" {}`
    * Problem2: " Error: configuring Terraform AWS Provider: validating provider credentials"
      * Attempt1: Add `terraform.required_version`
      * Attempt2: Add provider.aws.profile
      * Attempt3: Pass a right ami
      * Note: `export TF_LOG=DEBUG` and check the logs. Authentication details are sent. `aws sts get-caller-identity` to validate AWS credentials
      * Solution: TODO: