* `terraform workspace new [options] name [dir]`
  * `[options]`
    * `-lock=false`
      * NOT hold a state lock
    * TODO:
    * `-state=pathToAStateFile`
      * initialize the state of the environment
* allows
  * creating new workspaces &
    * switch immediately to that one

## Examples
* `terraform workspace new example`
* `terraform workspace new -state=terraform.tfstate basedonstate`
