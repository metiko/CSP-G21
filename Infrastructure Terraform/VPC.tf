######################################################################################
#                VIRTUAL PRIVATE CLOUD AND ALL IT'S COMPONENTS
######################################################################################

# Terraform Provider
provider "aws" {
  region = var.region
}

# The VPC Resource
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "demo_vpc"
  }
}

# The Private Subnets
resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = var.availablity_zone1

  tags = {
    Name = "private_subnet_1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = var.availablity_zone2

  tags = {
    Name = "private_subnet_1b"
  }
}

# The Public Subnets
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = var.availablity_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = var.availablity_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1b"
  }
}

# The Private AWS Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = aws_nat_gateway.demo_nat.id
  }

  tags = {
    Name = "private"
  }
}

# The Public AWS Route Table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.demo_igw.id
  }

  tags = {
    Name = "public"
  }
}

# The Route Table associations
resource "aws_route_table_association" "private_subnet_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public.id
}

# The Elastic IP Resource
resource "aws_eip" "demo_eip" {
  vpc = true

  tags = {
    Name = "demo_eip"
  }
}

# The NAT Gateway
resource "aws_nat_gateway" "demo_nat" {
  allocation_id = aws_eip.demo_eip.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "demo_nat"
  }

  depends_on = [aws_internet_gateway.demo_igw]
}

# The Internet Gateway
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo_igw"
  }
}





