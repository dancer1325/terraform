provider "aws" {
  region = "us-east-2"
  profile = "default"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-abc123"
  #ami = "al2023-*"       -- Pass a valid ami

  # postcondition on lifecycle -- based on -- self object
  lifecycle {
    postcondition {
      condition     = self.instance_state == "running"
      error_message = "EC2 instance must be running."
    }
  }
}
