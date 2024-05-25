terraform {
  backend "s3" {
    # variable NOT allowed
    #bucket = "${local.s3_bucket_name}"
    bucket = "alfred-example"
    key    = "path/to/my/key"
    # variable NOT allowed
    # 1. local value
    #region = "${local.aws_region}"
    # 2. variable
    #region = var.s3_region
    region = "us-east-1"
    workspace_key_prefix = "prefixwork"
    encrypt = true
    dynamodb_table = "alfred-example-state-lock"
  }
}
