- `terraform show`
    - allows
      - checking the current state
    - `-json`
        - allows inspecting
            - latest full state snapshopt’s
            - saved plan files
              - **Note:** includes a copy prior to make the `terraform plan`
- TODO:
## Examples
* `terraform init` & `terraform plan`
* `terraform show`
  * NO state
    * Reason: NO infrastructure created yet
* `terraform apply`
* `terraform show`
  * STATE right now displayed!!