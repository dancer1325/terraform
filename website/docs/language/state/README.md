* == `.json` files which      -- Follow the steps to create it, and check it -- 
  * goal
    * store 1to1 bindings between objects in a remote system ↔ resource instances declared in the configuration
  * `terraform state` - to perform - basic modifications
    * discouraged editing directly this file 
  * allows
    * real world resources — are mapped to → configuration
    * keeping track of metadata
      * → determine the changes to make to the infrastructure
        **Note:** ⚠️prior to any operation → Terraform does a `refresh`⚠️
    * improving performance for large infrastructures
  * produced by earlier versions — are compatible with — new Terraform versions
* “terraform.tfstate”
  * default file to store the state
* Recommendations
  * store in Terraform Cloud 
      **Reasons:** version, encrypt, share
* Ways to alter the 1to1 bindings
  * import externally-created objects — via — `terraform import` → add binding
  * forget existing object — via — `terraform state rm` → delete binding
* Ways to get a state to be consumed typically by external software
  * `terraform output -json`
  * `terraform show -json`

# How has 'terraform.tfstate' been created?
* add dummy ‘main.tf’   -- if you do NOT create it -> nothing happens --
* `terraform apply`

* TODO:

# Note
* Use 'main.tf' in this directory