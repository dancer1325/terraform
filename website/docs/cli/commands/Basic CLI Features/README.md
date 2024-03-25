# Prerequisites
* [Install terraform](https://developer.hashicorp.com/terraform/install)

# `-chdir`
* `terraform -chdir=PathDirectoryToChange COMMAND`
* := global option which
  * change path to read / write ⚠️previous to apply the command ⚠️
    * `terraform -chdir=change init`
    * if the directory does NOT exist -> it fails
      * `terraform -chdir=changes init`
    * exceptions -- in which although you pass → path NOT changed ⚠️--
      * CLI Configuration
      * reference to `path.cwd` in CLI Configuration
  * uses
    * wrapping terraform in automation scripts