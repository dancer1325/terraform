terraform {
  required_providers {
    #aws_specificlocalname = {      NOT allowed localName
    awsspecificlocalname = {
      source = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}

provider "awsspecificlocalname" {
  region = "us-west-2"
}

#resource "awsspecificlocalname_instance" "example" {
#resource "awsspecificlocalname_aws_instance" "example" {
resource "aws_instance" "example" {
  provider = awsspecificlocalname           # NECESSARY to indicate the referred provider to use, else
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

# provider reference NOT specified
resource "aws_instance" "exampletwo" {
  #provider = awsspecificlocalname           # NECESSARY to indicate the referred provider to use, else inferred the installed one
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}