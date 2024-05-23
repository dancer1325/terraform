- `file(path)`
- allows
  - reading the contents of the file / returns a string
    - file content -- is interpreted as -- UTF-8 encoded text
      - if there are invalid UTF-8 characters -> produces an error
      - string in Terraform == sequence of Unicode characters
- TODO:

## Examples
* `terraform console`
  * `file("hello.txt")`
