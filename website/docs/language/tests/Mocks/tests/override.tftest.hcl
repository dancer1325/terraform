# 1. Override data under mock_provider at root level
mock_provider "aws" {
  override_data {
    target = module.credentials.data.aws_s3_object.data_bucket
    values = {
      #body = "{\"username\":\"username\",\"password\":\"password\"}"
      #body = "{\"username\"=\"username\",\"password\"=\"password\"}"
      body = "{\"username\":\"username\",\"password\":\"password\"}"
    }
  }
}

run "test" {
  # command   NOT specified -> apply
  # module  NOT specified -> directory in which you run `terraform test`
  variables {
    bucket_name = "override-bucket-name"
  }
  assert {
    # condition     = replace(jsondecode(local_file.credentials_json.content),"\\\"","\"").username == "username"
    #condition     = local_file.credentials_json.content.username == "username"
    condition     = local_file.credentials_json.content.username == "username"
    #condition     = jsondecode(local_file.credentials_json.content).username == "username"
    error_message = "incorrect username"
  }
}

# 2. Override at root test level
// TODO: Uncomment to test
/*
mock_provider "aws" {}

override_data {
  target = module.credentials.data.aws_s3_object.data_bucket
  values = {
    body = "{\"username\":\"username\",\"password\":\"password\"}"
  }
}

run "test_file_override" {
  assert {
    condition     = jsondecode(local_file.credentials_json.content).username == "username"
    error_message = "incorrect username"
  }
}

run "test_run_override" {
  # The value in this local override block takes precedence over the
  # alternate defined in the file.
  override_data {
    target = module.credentials.data.aws_s3_object.data_bucket
    values = {
      body = "{\"username\":\"a_different_username\",\"password\":\"password\"}"
    }
  }

  assert {
    condition     = jsondecode(local_file.credentials_json.content).username == "a_different_username"
    error_message = "incorrect username"
  }
}*/

# 3. override_module
// TODO: Uncomment to test
/*mock_provider "aws" {}

override_module {
  target = module.credentials
  outputs = {
    data = { username = "username", password = "password" }
  }
}

run "test" {
  assert {
    condition     = jsondecode(local_file.credentials_json.content).username == "username"
    error_message = "incorrect username"
  }
}*/
