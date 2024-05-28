provider "aws" {}

mock_provider "aws" {
  # alias   -- Required to distinguish with traditional provider
  alias = "fake"
}

variables {
  bucket_name = "my-bucket-name-mocked"
}

/*run "use_real_provider" {
  # Specify which provider to use
  providers = {
    aws = aws
  }

  # command   NOT specified -> apply
  # module  NOT specified -> directory in which you run `terraform test`
}*/

run "use_mocked_provider" {
  # Specify which provider to use
  providers = {
    aws = aws.fake
  }

  # command   NOT specified -> apply
  # module  NOT specified -> directory in which you run `terraform test`
}

# mocking resources and data sources
# 1. all in
mock_provider "aws" {
  alias = "mockresourceanddatasourceallin"
  mock_resource "aws_s3_bucket" {
    defaults = {
      arn = "arn:aws:s3:::name"
    }
  }
  mock_data "aws_s3_bucket" {
    defaults = {
      arn = "arn:aws:s3:::name"
    }
  }
}

run "use_mockresourceanddata_declaredin" {
  providers = {
    aws = aws.mockresourceanddatasourceallin
  }
}

# 2. all splitted
mock_provider "aws" {
  alias = "mockresourceanddatasourceallout"
  source = "./tests/aws"
}

run "use_mockresourceanddata_declaredout" {
  providers = {
    aws = aws.mockresourceanddatasourceallout
  }
}
