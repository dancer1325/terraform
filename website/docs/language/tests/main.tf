# main.tf

provider "aws" {
  region = "eu-central-1"
}

variable "bucket_prefix" {
  type = string
}

variable "pass_via_file" {
  type = string
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_prefix}-bucket"
}

resource "aws_s3_bucket" "bucket_via_variablefile" {
  bucket = "${var.pass_via_file}-bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
