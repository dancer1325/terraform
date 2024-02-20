# Prerequisites
* [Install terraform](https://developer.hashicorp.com/terraform/install)

# merge
* `merge(#arbitraryOfMapsOrObjects)`
  * returns 1! mapOrObject with all elements
  * if mapOrObject1’s keyOrAttribute = mapOrObject2’s keyOrAttribute → last one takes precedence
  * + `...` -> separate elements
  * `terraform plan` & check in the output that it makes sense

# How to run locally?
* `terraform init`
