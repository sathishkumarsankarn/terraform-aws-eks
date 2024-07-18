resource "aws_nat_gateway" "eks_natgtw" {
  allocation_id = aws_eip.eks_nat_eip.id
  subnet_id     = aws_subnet.public_subnet01.id

  tags = {
    Name = "${local.env}-natgtw"
  }

  depends_on = [aws_internet_gateway.eks_igtw, aws_eip.eks_nat_eip, aws_subnet.public_subnet01]
}

resource "aws_eip" "eks_nat_eip" {
  domain   = "vpc"
  tags = {
    Name = "${local.env}-eks-nat-eip"
  }
}