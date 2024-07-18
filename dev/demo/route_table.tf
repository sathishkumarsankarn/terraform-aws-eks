resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_natgtw.id
  }

  tags = {
    Name = "${local.env}-private-route-table"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igtw.id
  }

  tags = {
    Name = "${local.env}-public-route-table"
  }
}

resource "aws_route_table_association" "private_assoication" {
  subnet_id      = aws_subnet.private_subnet01.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_assoication" {
  subnet_id      = aws_subnet.private_subnet02.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_assoication" {
  subnet_id      = aws_subnet.public_subnet01.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_assoication" {
  subnet_id      = aws_subnet.public_subnet02.id
  route_table_id = aws_route_table.public.id
}