provider "aws" {
  region = "eu-west-2"
   assume_role {
    role_arn = var.aws_master_role
  }
}

# terraform {
#   backend "s3" {
#     bucket         = var.bucket_name
#     key            = "terraform.tfstate"
#     region         = "eu-west-2"
#     dynamodb_table = "cosmin-terraform-state-lock"
#   }
# }


resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Author = "amigo-cosmin"
  }
}
