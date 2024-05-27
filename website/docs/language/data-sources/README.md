- allows
    - importing data in your Terraform configuration from
        - APIs
        - other Terraform state backends
- typical use cases
    - AMI id from cloud providers
    - Terraform outputs
- each provider offers some
  - _Example:_ [AWSAndFilterByDataSource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- 
    ```
    data "DataResourceName" "DataNameToImportIt" {
      specificResourceArguments
       metaArguments
       filter {
      }
    }
    ```
  - `data.DataResourceName.DataNameToImportIt`
    - ⚠️must be unique within the module ⚠️
    - way to refer to it
  - `specificResourceArguments`
    - allows
      - restricting the data source
  - `metaArguments`
    - TODO:
  - `filter`
    - TODO:
- vs Resources
  - 👁️data source is just for reading objects 👁️
  - any data source — has an — associated Resources
- TODO:

## Examples:
* [aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)
* `terraform init`
* `terraform plan`
  * Problems:
    * Problem1: "Error: Your query returned no results."
      * Solution: Adjust the filters
  * Check that output returns values
* `terraform apply`
  * Check that output returns values