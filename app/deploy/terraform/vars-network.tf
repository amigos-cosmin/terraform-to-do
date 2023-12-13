variable "vpc_cidr" {
  type        = string
  description = "CIDR range"
}

variable "public_subnet_cidrs" {
  type        = string
  description = "Public subnet"
}

variable "private_subnet_cidrs" {
  type        = string
  description = "private subnet"
}

variable "network_availability_zones" {
  type        = string
}