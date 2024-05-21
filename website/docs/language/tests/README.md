- NOT part of the workflows
    - plan OR
    - apply
- allows
    - validating module configuration / NO impact to existing
        - state file OR
        - resources
- How does it work?
    - by default, build ephemeral infrastructure
      - == create real infrastructure → == integration test
        - **Reason:** 🧠 Check `run` block below 🧠
    - test assertions — against — in-memory state
- == ‘.tftest.hcl’ OR ‘.tftest.json’ + helper modules
    - .tftest.hcl OR ‘.tftest.json’
      - test files
      - 1 test / test file
      - syntax
        - `run “someName” { … }`
          - ≥ 1 of [run](https://developer.hashicorp.com/terraform/language/tests#run-blocks) blocks
            - 👁️executed in order 👁️
          - `command`
            - := field / optional
              - possible values
                - `apply`
                  - default one
                - `plan`
                  - → 👁️infrastructure NOT created👁️== unit testing
          - `assert`
            - := field / optional
              - == Custom Conditions
              - — can refer to — 
                - any existing References to Values
                  - **Note:** 👁️even available to other Custom Conditions 👁️
                - outputs from current OR previous `run` blocks
          - TODO: 
        - `variables { … }`
          - ≥ 0 variables blocks
          - 👁️order does NOT matter 👁️
          - processed all these blocks before processing run blocks
        - `provider “type” { … }`
          - ≥ 0 provider blocks
          - 👁️order does NOT matter 👁️
          - processed all these blocks before processing run blocks
    - helper modules
        - optional
        - uses
            - create outside main configuration
                - test-specific resources &
                - data sources

- TODO:

## Example
* Check 'main.tf' & subfolder '/tests'
* How has it been created?
  * manually
  * `terraform fmt`
    * format files in the path in which it's run == if you want to execute on '/tests' -> navigate to that path
* How to run tests?
  * `terraform init`
  * `terraform test`