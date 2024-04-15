provider "aws" {
  region = var.aws_region
}


locals {
  cluster_name = "${var.env}-challenge"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name                 = "${var.env}-vpc"
  cidr                 = var.vpc_cidr
  azs                  = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

