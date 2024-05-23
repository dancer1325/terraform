- `terraform console`
    - if configurations just have local backends → allowed `-state`
- allows
    - evaluating Expressions — via —
      - interactive console
        - _Example:_ test interpolations, test values / saved in the state
        - about the state
            - if it’s empty OR not created → not problem
            - if there is state → state locking
      - non-interactive by `|` 
- `exit` or Control-C or Control-D
    - close the interactive console
- TODO:
- how does it work?
    - read the
        - Terraform configuration in the current working directory
        - Terraform state file — from the — configuration backend

## Examples
* non-interactive
  * `echo 'split(",", "foo,bar,baz")' | terraform console`
* interactive console
  * `terraform init`
  * `terraform console` & in the interactive shell
    * `var.apps` OR
    * `var.apps.foo` OR
    * `{ for key, value in var.apps : key => value if value.region == "us-east-1" }` OR
    * `random_pet.example` OR
      * resources are NOT known after apply
    * `cidrnetmask("172.16.0.0/12")`
      * test functions