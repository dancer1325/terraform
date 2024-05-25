- allows
    - defining
        - path in which to store State data files
        - way to execute operations
- Persistent data store in the backend — belongs to a — Workspaces
- if you use HCP Terraform → NOT needed to configure
  - **Reason:** 🧠automanage the state 🧠
- restrictions
    - 1! backend block / configuration
    - — can NOT refer to — named values
      - *Example:* Input Variables, Local Values
    - values declared within backend block — can NOT be referred — elsewhere
- 
    ```
    terraform {
      backend “availableBackendType” {
        argumentsSpecificOfTheBackendType
      }
    }
    ```
- characteristics
    - if backend’s configuration is changed → you must run `terraform init`
    - once you run `terraform init`  → ‘.terraform/’ is created
        - “.terraform/terraform.tfstate”
            - := file / backend configuration for the current working directory
            - ⚠️NOT push it⚠️
    - if you want to switch backend1 → backend2 —- you can migratel the state
        - *Note:** 🧠Recommended to back up 🧠 
- Partial configuration
    - := omit `argumentsSpecificOfTheBackendType`
        - → you need to provide in initializing working directories
            - ways
            **Note:** 👁️ if you provide several options → they are merged👁️
                - `-backend-config=PathToTheFile`
                - `-backend-config="KEY=VALUE”`
                - interactively asked during `terraform init`
    - recommended to pass the credentials 
- TODO: