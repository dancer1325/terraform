- Requirements
    - Terraform v1.7.0+
        - beta
- allows
    - mocking
        - Providers
        - Resources
        - Data sources
    - testing parts WITHOUT
        - creating infrastructure OR
        - requiring credentials
- `mock_provider “providerName” { … }`
    - schema returned == original provider’s schema returned
    - share the global namespace with — traditional provider
      - if you define several in a test → you need to declare `alias`
    - == traditional provider — during terraform test —
- TODO:

## Example
* Check 'main.tf' & subfolder '/tests'
* How has it been created?
  * manually
  * `terraform fmt`
    * format files in the path in which it's run == if you want to execute on '/tests' -> navigate to that path
* How to run tests?
  * `terraform init`
  * `terraform test`
