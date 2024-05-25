- `terraform output [options] [outputName]`
  - allows
    - from state file -- extract -- value of an output variable
  - if `[outputName]` NOT specified -> returns all
  - `-json`
    - get the output in .json
  - `-raw`
    - get the output without wrapping under ''
  - TODO:

## Examples
* `terraform init`
* `terraform apply`
  * if you do NOT run it -> NO output got
    * Reason: outputs come from configuration's state file
* `terraform output`
  * `terraform output password`
    * Why does it retrieve the default value? TODO:
  * `terraform output -json instance_ips`
    * format the output in json format
  * `terraform output -raw instance_ips`
