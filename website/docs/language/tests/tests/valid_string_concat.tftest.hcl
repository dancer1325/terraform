# valid_string_concat.tftest.hcl

variables {
  bucket_prefix = "test"
}

run "valid_string_concat" {

  # -> NOT create real infrastructure
  command = plan

  # assert == custom conditions
  assert {
    condition     = aws_s3_bucket.bucket.bucket == "test-bucket"
    # == previous one / -- refer to -- output from current `run` block
    # condition     = output.bucket_name == "test-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}
