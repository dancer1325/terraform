terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "object" {
  bucket = var.bucket_name
  key    = "credentials.json"
  source = "./credentials.json"
}

# For overrides
module "credentials" {
  source = "./modules/s3_data"

  data_bucket_name = "alfred-28-05-24"
}

resource "local_file" "credentials_json" {
  filename = "credentials.json"
  content  = jsonencode(module.credentials.data)
}

output "module_credentials_data" {
  value = module.credentials.data
}
