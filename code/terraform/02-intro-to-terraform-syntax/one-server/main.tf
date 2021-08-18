terraform {
  required_version = ">= 1.0.5, < 2.0.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08046b3f92ed2f520"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-one-server"
  }
}

