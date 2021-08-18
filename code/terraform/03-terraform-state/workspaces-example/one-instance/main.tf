terraform {
  required_version = ">= 1.0.5, < 2.0.0"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

terraform {
  backend "s3" {

    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    # bucket         = "<YOUR S3 BUCKET>"
    # key            = "<SOME PATH>/terraform.tfstate"
    # region         = "eu-central-1"
    # dynamodb_table = "<YOUR DYNAMODB TABLE>"
    # encrypt        = true

  }
}

resource "aws_instance" "example" {
  ami           = "ami-08046b3f92ed2f520"

  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"

}

