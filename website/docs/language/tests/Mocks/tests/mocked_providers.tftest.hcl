# mocked_providers.tftest.hcl

provider "aws" {}

mock_provider "aws" {
  # alias   -- Required to distinguish with traditional provider
  alias = "fake"
}

variables {
  bucket_name = "my-bucket-name-mocked"
}

run "use_real_provider" {
  # Specify which provider to use
  providers = {
    aws = aws
  }
}

run "use_mocked_provider" {
  # Specify which provider to use
  providers = {
    aws = aws.fake
  }
}
