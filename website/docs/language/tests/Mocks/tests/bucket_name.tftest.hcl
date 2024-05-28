mock_provider "aws" {}

run "sets_correct_name" {
  # command   NOT specified -> apply
  # module  NOT specified -> directory in which you run `terraform test`
  variables {
    bucket_name = "my-bucket-name"
  }

  assert {
    condition     = aws_s3_bucket.my_bucket.bucket == "my-bucket-name"
    error_message = "incorrect bucket name"
  }
}
