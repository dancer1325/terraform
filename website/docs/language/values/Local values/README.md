- allows
    - names — are assigned to → Expressions
        - Note: 👁️any kind of expression 👁️
        - → avoid repeating an expression
        - == program language function’s temporary local variables
- syntax
```
 locals {
   localName1 = expression1
   …
 }
```
- `local.localName1`
    - way to refer to it
    - ⚠️JUST can be accessed within the module in which it’s declared⚠️

## Example
* Check 'main.tf'
* How to run locally?
  * `terraform init`
  * `terraform plan`