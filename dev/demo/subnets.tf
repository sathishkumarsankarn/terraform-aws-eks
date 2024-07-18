resource "aws_subnet" "private_subnet01" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = local.az1

  tags = {
    "Name"                                    = "${locals.env}-private-subnet01"
    "kubernetes.io/role/internal-elb"         = 1
    "kubernetes.io/cluster/${local.eks_name}" = "owned"

  }
}

resource "aws_subnet" "private_subnet02" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = local.az2

  tags = {
    "Name"                                    = "${locals.dev}-private-subnet02"
    "kubernetes.io/role/internal-elb"         = 1
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_subnet01" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = local.az2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                    = "${locals.dev}-public-subnet01"
    "kubernetes.io/role/elb"                  = 1
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_subnet02" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = local.az1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                    = "${locals.dev}-public-subnet02"
    "kubernetes.io/role/elb"                  = 1
    "kubernetes.io/cluster/${local.eks_name}" = "owned"
  }
}
