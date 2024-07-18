resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.vpc_dns_host
  enable_dns_support   = var.vpc_dns_support
  tags = {
    Name = "${local.env}-vpc-main"
  }
}