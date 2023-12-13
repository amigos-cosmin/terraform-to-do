provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account_id]
}

provider "aws" {
  alias  = "master_role"
  region = var.region
  assume_role {
    role_arn = var.aws_master_role
  }
}

terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.76.1"
    }
  }
}


locals {
  base_tags = {
    stack = var.stack
    env   = var.env
  }
}