module "network" {
  source               =  "git::https://github.com/tech-amigos-limited/labs-ta-infra-modules-expansion.git//network"
  stack                = var.stack
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = split(",", var.public_subnet_cidrs)
  private_subnet_cidrs = split(",", var.private_subnet_cidrs)
  availability_zones   = split(",", var.network_availability_zones)
  create_vpc_endpoint  = false
}

resource "aws_ssm_parameter" "public_subnet_az1" {
  name       = "/${var.env}/${var.stack}/core/public-subnet-id-az1"
  type       = "SecureString"
  value      = module.network.public_subnet_ids[0]

  tags = {
    env        = var.env
    stack      = var.stack
    app        = "core"
    created-by = "terraform"
  }
}

resource "aws_ssm_parameter" "public_subnet_az2" {
  name       = "/${var.env}/${var.stack}/core/public-subnet-id-az2"
  type       = "SecureString"
  value      = module.network.public_subnet_ids[1]

  tags = {
    env        = var.env
    stack      = var.stack
    app        = "core"
    created-by = "terraform"
  }
}

resource "aws_ssm_parameter" "private_subnet_az1" {
  name       = "/${var.env}/${var.stack}/core/private-subnet-id-az1"
  type       = "SecureString"
  value      = module.network.private_subnet_ids[0]

  tags = {
    env        = var.env
    stack      = var.stack
    app        = "core"
    created-by = "terraform"
  }
}

resource "aws_ssm_parameter" "private_subnet_az2" {
  name       = "/${var.env}/${var.stack}/core/private-subnet-id-az2"
  type       = "SecureString"
  value      = module.network.private_subnet_ids[1]

  tags = {
    env        = var.env
    stack      = var.stack
    app        = "core"
    created-by = "terraform"
  }
}