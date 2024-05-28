# Although here I do NOT test the resource using var.bucket_prefix -- necessary to pass
variables {
  bucket_prefix = "test"
}

run "check_bucket_name_passed_via_file" {

  command = plan

  assert {
    condition     = aws_s3_bucket.bucket_via_variablefile.bucket == "alfred-test-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}

