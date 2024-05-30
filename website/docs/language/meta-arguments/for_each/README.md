- := meta-argument
- Uses
  - `resource`
    - **Note:** 👁️of any type👁️
  - `module`
- ways to create several similar objects / avoid repeating `resource{…}` & `module{..}`
  - via
    - `count` OR
    - `for_each` /
      - distinct infrastructure object associated == separately
        - created
        - updated
        - destroyed
  - restrictions
    - ⚠️`count` & `for_each` can NOT be used at the same time / same block ⚠️
- `for_each collection`
  - `each.`
    - := object / available in block using `for_each`
  - `collection`
    - 👁️must be known — before — Terraform performs resource actions 👁️
    - if `collection` is `map` →
      - `each.key` == map’s key
       - `each.value` == map’s value
    - if `collection` is `set(string)` →
      - `each.key` == set’s value
      - `each.value` == `each.key`
    - from
      - nested data structures — via `flatten` to get a — `collection`
      - elements from ≥ 1 `collection` — via `setproduct` to get a — `collection`
```
  resourceOrModule … {
    for_each collection
    ...
    ... each. ...
    ...
  }
```
- TODO: Limitations on values used in for_each

## Examples
* AWS account with [associated credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)
    * via
      * add in the 'provider' block
      * environment variables
        * 'AWS_ACCESS_KEY_ID'
        * 'AWS_SECRET_ACCESS_KEY'
        * 'AWS_REGION'
      * credential files
        * `aws config` & pass the 'AWS_ACCESS_KEY_ID' & 'AWS_SECRET_ACCESS_KEY'
* [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
  * [authenticate to Azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure)
    * TODO:
* Each '*.tf' in a subfolder -> child module
* `terraform init`
* `terraform plan`
  * Check ALL the resources directly or indirectly via the child module, planned to be created