data "aws_ami" "example" {
  # Specic data source's arguments to filter
  most_recent = true

  /*owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }*/
}

// Added just to output the dataSource
output "ami" {
  value = data.aws_ami.example
}

