variable "data_bucket_name" {
  type = string
}

data "aws_s3_object" "data_bucket" {
  bucket = var.data_bucket_name
  key    = "credentials.json"
}

output "data" {
  # data.aws_s3_object.data_bucket.body       is already a JSON string
  #value = jsondecode(data.aws_s3_object.data_bucket.body)
  value = data.aws_s3_object.data_bucket.body
}
