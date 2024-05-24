- `regexall(pattern, string)`
- allows
  - applying a regular expression to a string
    - returns list of all matches
      - if there is NO capture group in the pattern -> result is a list(string)
      - if there is >= 1 unnamed capture group in the pattern -> result is a list(list)
      - if there is >= 1 named capture group in the pattern -> result is a list(map)

## Examples
* `terraform console`
  * `regexall("[a-z]+", "1234abcd5678efgh9")`
  * `length(regexall("[a-z]+", "1234abcd5678efgh9"))`
  * `length(regexall("[a-z]+", "123456789")) > 0`