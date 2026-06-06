#vpc
resource "aws_vpc" "poc_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "poc-vpc"
  }
}

#subnet
resource "aws_subnet" "poc_public_subnet" {
  vpc_id                  = aws_vpc.poc_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "poc-public-subnet"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "poc_igw" {
  vpc_id = aws_vpc.poc_vpc.id

  tags = {
    Name = "poc-igw"
  }
}

#Route Table
resource "aws_route_table" "poc_public_rt" {
  vpc_id = aws_vpc.poc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.poc_igw.id
  }

  tags = {
    Name = "poc-public-rt"
  }
}

#Route Table Association
resource "aws_route_table_association" "poc_public_assoc" {
  subnet_id      = aws_subnet.poc_public_subnet.id
  route_table_id = aws_route_table.poc_public_rt.id
}