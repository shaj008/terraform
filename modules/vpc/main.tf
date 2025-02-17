provider "aws" {
  region = var.region
}

module "vpc" {
  source = "s3::https://hc-terraform-template.s3.ap-south-1.amazonaws.com/vpc-module/"

  #vpc_name           = var.vpc_name
  #cidr_block         = var.cidr_block
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  tags               = var.tags
  environment        = var.environment
  create_nat_gateway = var.create_nat_gateway
}

