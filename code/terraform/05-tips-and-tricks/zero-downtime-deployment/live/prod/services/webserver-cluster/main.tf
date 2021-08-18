terraform {
  required_version = ">= 1.0.5, < 2.0.0"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  ami         = "ami-08046b3f92ed2f520"

  server_text = var.server_text

  cluster_name           = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key

  instance_type      = "m4.large"
  min_size           = 2
  max_size           = 10
  enable_autoscaling = true
}

