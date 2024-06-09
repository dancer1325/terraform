- == native grammar of Terraform Language
    - human readable
- uses
    - Terraform
    - other Hashicorp products
- [specification](https://github.com/hashicorp/hcl/blob/main/hclsyntax/spec.md)
- main constructs
    - arguments OR attributes
        - `argumentName = argumentValue`
            - `argumentValue`
                - 👁️‘s types 👁️ depend on the context where it appears
                    - in Resources → determined by it’s schema
                    - others → arbitrary Expressions
        - == value — assigned to a — particular name
    - blocks
      - := container for other content
      -
      
        ```
         blockType “label1” “label2” … {
             otherArguments
             nestedBlocks  
         }
        ```
      
        - `labeli`
          - #OfLabels — determined by — `blockType`
          - allows
            - creating >1 instance of the same `blockType` / ≠ `labeli`
        - `blockType`
          - ⚠️top-level (≠ nested) of blockTypes are limited ⚠️
- identifiers
    - implement [**UNICODE IDENTIFIERS AND SYNTAX](https://unicode.org/reports/tr31/) + `-`**
    - are
        - `argumentName`
        - `blockType` ’s `labeli`
        - `resource_name`
        - `variableName`
        - …
    - can contain
        - letters
        - digits
          - **Note:** 👁️except to the 1@ character 👁️
        - `_`
        - `-`
- comments
    - `#`
      - **Note:** Recommended one
    - `//`
    - `/* Start delimiter ….  End delimiter*/`
- Character Encoding
    - TODO:
- Line Endings
    - TODO: