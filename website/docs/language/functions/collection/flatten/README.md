* `flatten(list(element, list(...),))`
* allows
  * list / elements can be nested data structures -> 1! list
* uses
  * `for_each`


## Examples
* `terraform console` &
  * `flatten([["a", "b"], [], ["c"]])` 
  * `flatten([[["a", "b"], []], ["c"]])`
  * `flatten("a",["a", "b"])`  -- ERROR because you do NOT pass a list --
  * `flatten([2, [3,4]])`
  * `flatten([2, [3,"a"]])`  -- list of elements of different types can be combined --
* `for_each`
  * `terraform init`
  * `terraform plan`
    * Problems:
      * Problem1: "Error: expected cidr_block to contain a valid network Value, expected 10.1.0.0/16, got 10.1.1.0/16"
        * Solution: TODO:
