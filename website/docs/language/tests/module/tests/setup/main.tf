variable "bucket" {
  type = string
}

// Create the resource
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
}
