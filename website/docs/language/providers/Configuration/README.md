- How to they work?
    - add providers’ configuration for some of them
      - **Note:** NOT valid for all
      - *Example:* endpoint URLs, cloud regions, ..
    - declare the providers to be used
- 
    ```
    provider “localNameToGive” {
      providerArguments
      alias
      version
    }
    ```
    - if you omit it → Terraform assumes an empty default configuration
    - `providerArguments` ’s values — can refer also to — Expressions known before
      - **Note:** attributes exported by resources, are NOT valid
    - `alias`
        - := meta-argument
        - allows
            - using same provider / different configurations
        - uses
            - use different provider’s configuration / resource or module basis
              - *Example:* several regions / cloud platform
    - `version`
        - := meta-argument
        - 👁️NOT recommended👁️
            - define in `required_providers.*.version`
- parent modules’ providers — to → child modules’ [providers](https://www.notion.so/providers-52c22f864c2c40c5a5c3e1f3130dafa0?pvs=21)