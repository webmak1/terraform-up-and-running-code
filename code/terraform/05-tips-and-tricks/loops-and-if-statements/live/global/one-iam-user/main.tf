terraform {
  required_version = ">= 1.0.5, < 2.0.0"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_iam_user" "example" {

  name = var.user_name

}
