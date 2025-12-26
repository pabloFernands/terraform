resource "aws_eip" "eks-ngw-ip-1a" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks-ngw-ip-1b" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

resource "aws_nat_gateway" "eks-ngw-1a" {
  allocation_id = aws_eip.eks-ngw-ip-1a.id
  subnet_id     = aws_subnet.subnet-public-1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_ngw_1a"
    }
  )
}

resource "aws_nat_gateway" "eks-ngw-1b" {
  allocation_id = aws_eip.eks-ngw-ip-1b.id
  subnet_id     = aws_subnet.subnet-public-1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_ngw_1b"
    }
  )
}

resource "aws_route_table" "eks_route_table_private_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_private_rt_1a"
    }
  )
}

resource "aws_route_table" "eks_route_table_private_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_private_rt_1b"
    }
  )
}