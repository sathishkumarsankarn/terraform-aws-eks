resource "aws_internet_gateway" "eks_igtw" {
  depends_on = [ aws_vpc.eks_vpc ]
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "${local.env}-igtw"
  }
}