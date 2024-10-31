resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_config.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_config.name
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.subnet_1_config.availability_zone
  cidr_block              = var.subnet_1_config.cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = "loadBalancer-subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.subnet_2_config.availability_zone
  cidr_block              = var.subnet_2_config.cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = "loadBalancer-subnet-2"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "route-table-loadebalncer"
  }
}

resource "aws_route_table_association" "sub1assoation" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.subnet_1.id
}

resource "aws_route_table_association" "sub2assoation" {
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.subnet_2.id
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "loadBalancer-igw"
  }
}
resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
