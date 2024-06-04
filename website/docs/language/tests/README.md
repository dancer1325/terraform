- NOT part of the workflows
    - `terraform plan` NOR
    - `terraform apply`
- allows
    - validating module configuration / NO impact to existing
        - state file OR
        - resources
- types
  - == integration test
    - by default
    - == create real infrastructure
  - == unit test
    - via `run ... { command = plan ... }`
    - Check '/mocks'
- How does it work?
  - test assertions — against — in-memory state
- == ‘.tftest.hcl’ OR ‘.tftest.json’ + helper modules — 👁️under test/ 👁️ — 
    - .tftest.hcl OR ‘.tftest.json’
      - test files
      ```
            variables {
              ...
            }
            provider “type” {
              ...
            }
            mock_provider “providerName” {
              ...
            }
            override_resource {
              ...  
            }
            override_data {
              ...  
            }
            override_module {
               ... 
            } 
            run "someName" {
              ...
            }
      ```
      ```
      variables {
        keyi = valuei
      }
      provider “type” {
        providerArguments
      }
      mock_provider “providerName” {
        alias = "..."
        source = PathToMockedProvider
        mock_resource "resource_name" {
          defaults = {
            resourceAttributes = ...
          }
        mock_data "data_name" {
          defaults = {
            resourceAttributes = ...
          }
        }
        override_resource {
          ...
        }
        override_data {
          ...
        }
       }
      override_resource {
         target = ResourceToOverride 
         values = 
      }
      override_data {
        target = DataToOverride
        values =  
      }
      override_module {
         target = ModuleToOverride
         outputs = 
      } 
      run "someName" {
        command = ...
        assert {
          condition = ...
          error_message= ...
        }
        variables {
          keyi = valuei
        }
        provider "type" {
          providerArguments
        }
        override_resource {
         target = ResourceToOverride 
         values = 
        }
        override_data {
          target = DataToOverride
          values =  
        }
        override_module {
         target = ModuleToOverride
         outputs = 
        }
        module {
          source = ...
          version= ...
        }
      }
      ```
      - syntax
        - `run “someName” { … }`
          - ≥ 1 of [run](https://developer.hashicorp.com/terraform/language/tests#run-blocks) blocks allowed
            - 👁️executed in order sequentially 👁️
          - `command`
            - := field / optional
              - possible values
                - `apply`
                  - default one
                  - ⚠️Once the test has ended up → resources created are destroyed⚠️
                - `plan`
                  - → 👁️infrastructure NOT created👁️== unit testing
          - `assert`
            - := field / optional
              - == Custom Conditions
              - — can refer to — 
                - any existing References to Values
                  - **Note:** 👁️even available to other Custom Conditions 👁️
                - outputs from current OR previous `run` blocks
              - ≥1 / run block
                - just if ALL are passed → run block is passed
          - `variables`
            - := field / optional
              - override the general `variables`
              - TODO:
          - `module`
            - := field / optional
              - 👁️ specify another configuration to test 👁️
                - **Note:** By default, it’s the path in which you run `terraform test` OR `terraform test -chdir`
              - vs traditional `module` blocks, just allowed to specify
              ```
                run {
                  ...
                  module {
                    source = ...
                    version = ....
                  }
                }
              ```
                - `source`
                  - possible values
                    - `local`
                    - `registry`
                - `version`
            - uses
              - setup modules  / create infrastructure for testing
              - validate secondary infrastructure
            - if you add a new helper module → terraform init 
          - `providers`
            - := field / optional
              - override the general `providers` 
          - `override_….`
            - Check '/Mocks'
          - TODO: 
        - `variables { … }`
          - ≥ 0 variables blocks allowed
            - 👁️order does NOT matter 👁️
            - processed all these blocks before processing run blocks
          - it will be applied to ALL run blocks
        - `provider “type” { … }`
          - ≥ 0 provider blocks allowed
            - 👁️order does NOT matter 👁️
            - processed all these blocks before processing run blocks
        - `override_`
          - Check '/Mocks'
    - helper modules
        - optional
        - uses
            - create outside main configuration
                - test-specific resources &
                - data sources
- 👁️variables precedence from higher → lower 👁️
  - `run.variables`
  - `variables` in test files
  - follow the typical input variables precedence
- TODO:

## Example
* Check 'main.tf' & subfolder '/tests'
* How has it been created?
  * manually
    * 'main.tf' contains ALL
      * [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
  * `terraform fmt`
    * format files in the path in which it's run == if you want to execute on '/tests' -> navigate to that path
* How to run tests?
  * `terraform init`
  * `terraform test` OR `terraform test -var pass_via_file=alfred-test`
