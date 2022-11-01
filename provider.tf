terraform {
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 1.1.0"
}
provider "aws"{
  region = "us-east-2"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile = "default"

  default_tags {
    tags = {
      hashicorp-learn = "module-use"
    }
  }
}
