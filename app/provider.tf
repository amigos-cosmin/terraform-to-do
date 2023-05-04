
terraform {
 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.76.1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
 assume_role {
    role_arn = var.aws_role
  }
}