# variable_precedence.tftest.hcl

variables {
  bucket_prefix = "test"
}

run "uses_root_level_value" {

  command = plan

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "test-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}

run "overrides_root_level_value" {

  command = plan

  # Override the global at the top variable.bucket_prefix provided
  variables {
    bucket_prefix = "other"
  }

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "other-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}
