terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-table"

    # Specify the workspace name dynamically using Terraform interpolation -- Error -- TODO: Why?
    #workspace_key_prefix = "workspace/${terraform.workspace}/"
  }
}
