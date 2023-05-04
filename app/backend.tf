terraform {
  backend "s3" {
    bucket = "cosmin-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "cosmin-terraform-state-lock"
    role_arn = "arn:aws:iam::443546222716:role/OrganizationAccountAccessRole"
  }
  
}