* allows
  * any Terraform value -- is parsed as -> [JSON string](https://datatracker.ietf.org/doc/html/rfc7159)
    * mapping
      * `string` (Terraform type) -> `String` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-7) 
      * `number` (Terraform type) -> `Number` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-6) 
      * `bool` (Terraform type) -> `Boolean` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-1) 
      * `object(...)` (Terraform type) -> `Object` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-4) 
      * `tuple(...)` (Terraform type) -> `Array` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-5) 
      * `null` (Terraform type) -> `Null` ([JSON type](https://datatracker.ietf.org/doc/html/rfc7159#section-1)
* `jsonencode(jsondecode(...))` -- NOT produce the original value
* TODO:

## Examples
* `terraform console` &
  * `jsonencode({"hello"="world"})`
