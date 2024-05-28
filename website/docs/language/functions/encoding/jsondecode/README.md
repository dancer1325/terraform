* allows
  * string -- is parsed as -> [JSON](https://datatracker.ietf.org/doc/html/rfc7159)
    * mapping
      * `String` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-7) -> `string` (Terraform type)
      * `Number` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-6) -> `number` (Terraform type)
      * `Boolean` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-1) -> `bool` (Terraform type)
      * `Object` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-4) -> `object(...)` (Terraform type)
      * `Array` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-5) -> `tuple(...)` (Terraform type)
      * `Null` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-1) -> `null` (Terraform type)
    * / -- returns a -- representation of JSON's value
      * -- with a -- automatic type conversion

## Examples
* `terraform console` &
  * `jsondecode("{\"hello\": \"world\"}")`
  * `jsondecode("true")`
  * `jsondecode("5qhdrele")`
    * Problems:
      * Problem1: "Call to function "jsondecode" failed: extraneous data after JSON object."
        * Reason: "5qhdrele" is NOT a valid JSON string 
        * Solution: `jsondecode("\"5qhdrele\"")`