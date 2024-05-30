- allows
  - string -- is parsed as -> subset of [YAML 1.2](https://yaml.org/spec/1.2/spec.html)
    - mapping
      - `!!str` ([YAML type](https://yaml.org/spec/1.2.2/#10113-generic-string)) -> `string` (Terraform type)
      - `!!float` ([YAML type](https://yaml.org/spec/1.2.2/#10214-floating-point)) -> `number` (Terraform type)
      - `!!int` ([YAML type](https://yaml.org/spec/1.2.2/#10213-integer)) -> `number` (Terraform type)
      - `!!bool` ([YAML type](https://yaml.org/spec/1.2.2/#10212-boolean)) -> ` bool` (Terraform type)
      - `!!map` ([YAML type](https://yaml.org/spec/1.2.2/#10111-generic-mapping)) -> ` object(...)` (Terraform type)
      - TODO:
    - / -- returns a -- representation of YAML's value
- TODO:

## Examples
* `terraform console` &
  * `yamldecode("hello: world")` -- map --
  * `yamldecode("true")` -- boolean --
  * `yamldecode("{a: &foo [1, 2, 3], b: *foo}")` -- json structure directly ? --
  * `yamldecode("{a: &foo [1, *foo, 3]}")`
  * `yamldecode("{a: !not-supported foo}")`
  * `yamldecode(file("example.yaml"))`