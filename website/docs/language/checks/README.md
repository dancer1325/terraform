- 
    ```
    check “CheckLocalName” {
      data “DataSourceName” {
        …`
      `}
      assert {
        condition = ...
        error_message = "..."
      }
    }
    ```
    - `data` …
        - Data sources
            - this one defined here, can NOT be accessed in rest of configuration
        - 0 or 1 allowed
        - allows
            - querying the dataSource / most updated
    - `assert …`
        - ≥ 1 allowed
- allows
    - verifying infrastructure as whole
- how does it work?
    - executed at the end of `terraform plan` & `terraform apply`
        - == decoupled from lifecycle of
            - Resources
            - Data sources
    - if it’s false the condition → produce WARNING messages
        - ⚠️BUT NOT blocked the runs⚠️
- check’s results
  - are stored in ‘terraform.tfstate’
- TODO:

## Example
* `terraform init`
* `terraform plan`
  * check that
    * Terraform website is load
    * status code is 200