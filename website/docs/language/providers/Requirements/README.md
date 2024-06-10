* [Link](https://developer.hashicorp.com/terraform/language/providers/requirements)

* 
    ```
    required_providers {
      localNameToGive = {
        source = ...
        version = ...
      }
      ...
    }
    ```
  * ⚠️nested block ⚠️
      ```
      terraform { 
        required_providers {
          ...
        }
      }
      ```
  * allows
    * specifying all about the providerS
    * installing the required providers for the module
  * `localNameToGive`
    * unique / module
    * uses
      * any part in the module / refer to it
    * allowed
      * giving any name 👁️BUT there is a preferred one (Recommended one)👁️
* TODO:

## Examples
* `terraform init`
* `terraform plan`
  * Check the commentaries in the code