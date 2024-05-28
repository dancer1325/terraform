variable "bucket" {
  type = string
}

data "aws_s3_objects" "objects" {
  bucket = var.bucket
}
