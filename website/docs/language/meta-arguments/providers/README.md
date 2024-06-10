- Check '../modules'
- ⚠️ := Map ⚠️
  - key
    - provider configuration names used in the child module
  - value
    - provider configuration names from the parent module
    - 👀If you have an alternate configuration (*Example:* alias) → `provider.alias` 👀
    - 👀If you pass a provider map to a child module → provider configuration names are remapped 👀
- allows
  - from parent module — passing provider configurations to → child module
  - ⚠️If the child module does not declare any configuration with alias →
    - `providers` is optional ⚠️
    - inherits all default ones from the parent module⚠️
      - **Note:** default === without alias
  - ⚠️If `providers` is specified → child module have access just to the one’s specified ⚠️

## Examples:
* `terraform init`
* `terraform plan`
  * Check how you are passing to child module

