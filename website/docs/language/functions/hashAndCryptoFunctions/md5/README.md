* allows
  * string ->
    * encoded as UTF-8
    * computes [MD5 hash](https://datatracker.ietf.org/doc/html/rfc1321) &
      * [security considerations about md5](https://datatracker.ietf.org/doc/html/rfc6151)
    * encodes it with lowercase hexadecimal digits
    
## Examples
* `terraform console` &
  * `md5("hello world")`