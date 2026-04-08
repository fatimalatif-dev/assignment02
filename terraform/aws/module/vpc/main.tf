resource "aws_vpc" "vpc" {
  cidr_block           = var.vpcCidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "vpc-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

# public subnet 

resource "aws_subnet" "publicSubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.publicCidrRange
  availability_zone = var.zone[0]
  map_public_ip_on_launch = true
 
  tags = {
    Name        = "publicSubnet-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

# private subnet

resource "aws_subnet" "privateSubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.privateCidrRange
  availability_zone = var.zone[1]
   tags = {
    Name        = "privateSubnet-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "igw-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

# Nat Gateway Elastic IP

resource "aws_eip" "eip_nat" {
  tags = {
    Name        = "eip-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

#  Nat Gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.publicSubnet.id
  tags = {
    Name        = "ngw-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

# public route table
resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "public-RT-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

#  route table association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.publicSubnet.id
  route_table_id = aws_route_table.publicRouteTable.id
}

# private route table

resource "aws_route_table" "privateRouteTable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name        = "private-RT-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

#  route table association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.privateSubnet.id
  route_table_id = aws_route_table.privateRouteTable.id
}
