provider "aws" {
  profile = "default"
  region = "${local.aws_region}"
  shared_credentials_files = ["$HOME/.aws/credentials"]
}

// Create it manually
/*
resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.s3_bucket_name
}*/
