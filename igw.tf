resource "aws_internet_gateway" "eks_GW" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}_igw"
    }
  )
}

resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_GW.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}_public_rt"
    }
  )
}


