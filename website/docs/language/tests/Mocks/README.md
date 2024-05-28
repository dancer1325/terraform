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
    - `override_resource`
    - `override_data`
- TODO:
- Overrides
  - types
    - `override_resource {…}`
    - `override_data {…}`
    - `override_module {…}`
  - uses
    - under `mock_provider`
    - under `run`
    - top level of test file
  - allowed attributes
    - `target = NameToOverride`
      - allowed for ALL types
    - `outputs`
      - valid for
        - `override_module`
      - optional
    - `values`
      - optional
      - valid for
        - `override_resource`
        - `override_data`

## Example
* Check 'main.tf' & subfolder '/tests'
* How has it been created?
  * manually
  * `terraform fmt`
    * format files in the path in which it's run == if you want to execute on '/tests' -> navigate to that path
* How to run tests?
  * `terraform init`
  * `terraform test`
    * Problems:
      * Problem1: 'tests/bucket_name.tftest.hcl' data.aws_s3_object.data_bucket.body is ....Call to function "jsondecode" failed: extraneous data after JSON object."
        * Solution: `data.aws_s3_object.data_bucket.body` is already a JSON string -> remove `jsondecode()`
      * Problem2: 'tests/mocked_providers.tftest.hcl' 'run.use_real_provider' Error: reading S3 Bucket (my_company_bucket_name) Object (credentials.json): couldn't find resource
        * Note: Since 'use_real_provider' fails -> 'use_mocked_provider' is skipped
        * Solution: `data.aws_s3_object.data_bucket.body` is already a JSON string -> remove `jsondecode()`
      * Problem3: 'tests/override.tftest.hcl' Error: Unsupported attribute jsondecode(local_file.credentials_json.content).username == "username"
        * Solution: TODO:
  * `terraform destroy`
    * clean up all resources created
* [local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)
