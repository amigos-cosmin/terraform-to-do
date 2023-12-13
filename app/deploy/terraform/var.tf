variable "aws_account_id" {
  type = string
}

variable "env" {
  type = string
}

variable "stack" {
  type    = string
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "aws_master_role" {
  type = string
  description = "Role to be assumed for actions on master account resources"
  default = ""
}

variable "subdomain_name" {
  type        = string
  description = "rds domain name"
  default     = "autorama.co.uk"
}

variable "master_route53_zone_id" {
   type        = string
   description = "route53 hosted zone"
   default     = "Z1MEXOVHZT1NX9"
}