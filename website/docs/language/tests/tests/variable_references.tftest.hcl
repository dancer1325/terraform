variables {
  global_value = "some value"
  bucket_prefix = "test"    # Although here I do NOT test the resource using var.bucket_prefix -- necessary to pass
}


run "run_block_one" {
  command = plan
  # -- refer to -- higher precedence level
  variables {
    local_value = var.global_value
  }

  assert {
    condition = var.local_value == "some value"
    error_message = "local_value does NOT match"
  }
}

run "run_block_two" {
  command = plan
  # -- refer to -- outputs from previous run blocks == all the module!!
  variables {
    local_value = run.run_block_one.bucket_name
  }

  assert {
    condition = var.local_value == "test-bucket"
    error_message = "local_value does NOT match"
  }
}
