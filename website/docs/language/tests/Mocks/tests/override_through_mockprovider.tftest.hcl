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
    #condition     = local_file.credentials_json.content.username == "username"
    condition     = jsondecode(local_file.credentials_json.content).username == "username"
    error_message = "incorrect username"
  }
}
