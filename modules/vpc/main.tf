resource "aws_vpc" "terraform" {
  cidr_block = var.cidr_block
  tags = {
    Name = "tf-vpc"
  }
}

#####
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = var.public_subnet_1
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = var.public_subnet_2
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = var.private_subnet_1
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = var.private_subnet_2
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "private_subnet_2"
  }
}

#####
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "terraform"
  }
}

#####
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

#####