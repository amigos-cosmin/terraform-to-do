variable "aws_master_role" {
  type = string
  description = "Role to be assumed for actions on master account resources"
  default = ""
}

variable "bucket_name" {
  type = string
  default = "cosmin-bucket"
}

variable "env" {
  type    = string
  default = "dev"
}