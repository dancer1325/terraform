* `try(argumentExpressions)`
* allows
  * evaluate ALL argumentExpressions / 
    * returns the first one WITHOUT errors
    * catch errors -- produced -- evaluating expressions
      * BUT NOT catch errors -- related to -- constructs
* uses
  * complex data structures
* TODO:
    
## Examples
* `terraform init`
* `terraform console` &
  * `try(local.foo.bar, "fallback")`  -- "baz" got --
  * `try(local.foo.boo, "fallback")`  -- "fallback" got --
  * `try(local.nonexist, "fallback")`  -- NOT caught --