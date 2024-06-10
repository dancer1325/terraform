provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias = "usw2"
  region = "us-west-2"
}

module "alfred" {
  source = "./childModule"
  providers = {
    aws = aws.usw2
  }
}