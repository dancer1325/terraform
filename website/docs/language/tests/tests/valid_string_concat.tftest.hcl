# valid_string_concat.tftest.hcl

# variables applied for all run blocks
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

# run block, overriding general variables
run "overrides_root_level_value" {

  command = plan

  # override the general variables
  variables {
    bucket_prefix = "other"
  }

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "other-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}