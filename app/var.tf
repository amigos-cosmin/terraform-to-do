variable "aws_role" {
  type = string
  description = "Role to be assumed for actions on master account resources"
  default = ""
}

variable "bucket_prefix" {
  type = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}
