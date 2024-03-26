* Check '../settings/Backend'
* `default`
  * initially 👁️ 1! workspace / backend     -- `terraform workspace list` --
    * → 1 State / that configuration  -- `terraform init` & TODO: -- 
  * can NOT delete it  -- `terraform workspace new alfred` & `terraform workspace new alfred` throws an error --
* some backends support multiple workspaces  -- TODO: --
  * →
    * multiple State / 1 configuration
    * Resources exist / workspace
  * possible ones -- Check the list --
* != Terraform Cloud's workspaces
* NOT recommended for systems /
  * separate credentials
  * separate access controls
* Check '../TerraformCLI/ManagingWorkspaces'
* `${terraform.workspace}` -- TODO: --
  * returns the name of the current workspace
  * uses
    * anywhere interpolation is possible
    
# Note
* TODO: How to test / validate some previous notes?
