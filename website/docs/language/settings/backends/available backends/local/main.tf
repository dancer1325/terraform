terraform {
  backend "local" {
    path = "./terraform.tfstate"
    lock_file = "./terraform.tfstate.lock"
  }
}

variable "first_variable" {
  description = "first variable"
  default = "random"
  type = string
}

output "first_output" {
  value = var.first_variable
}

/*
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}*/
