# `terraform`
```
terraform { 
    … RulesToFollow 
  }
```
* syntax
* `RulesToFollow`
  * only constant values
  * arguments
    * — can NOT refer to — named objects
      * _Example:_ Resources, Input Variables
    * — can NOT use — built-in Terraform Functions

# `cloud`
```
terraform {
    cloud {
        ...
    }
}
```
* nested block
* allows
  * enabling CLI-driver Runs
* Check '/Cloud
* Check '.../CLI/Using Terraform Cloud'

# `backend`
```
terraform {
    backend {
        ...
    }
}
```
* nested block
* allows
  * configuring state backend Terraform
* Check '/Backends'

# `required_version`
```
terraform {
    required_version = VersionConstraintString
}
```
* nested element
* allows
  * specifying the versions of Terraform CLI to use
    * if the running Terraform version ≠ `required_version` → error
    * NOT apply to Resources — implemented by — Providers
  * if you use child modules & own version / child module → all must be satisfied

# `experiments = []`
```
terraform {
    experiments = [LanguageFeatureName]
}
```
* nested element
* allows
  * enabling new language features   -- Check the available ones in '/internal/experiments/' --
* if you run `terraform plan` or `terraform apply` & you use a language feature → warning message is displayed  -- Run `terraform plan` --
  * TODO: Why do I get an Error instead of Warning?
* NOT recommended to use in production

# `provider_meta`
* Check 'internals/ProviderMeta'

# Note
* TODO: How to test / validate the Terraform settings characteristics / features?
  * Attempt1: Look for the settings code, and check the tests