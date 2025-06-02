resource "aws_vpc" "cap-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="cap-vpc"
    }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.cap-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public-subnet"
  }
  availability_zone = var.public_availability_zone
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.cap-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "private-subnet"
  }
  availability_zone = var.private_availability_zone
}

resource "aws_internet_gateway" "cap-internet-gateway" {
  tags = {
    Name = "cap-igw"
  }
  vpc_id = aws_vpc.cap-vpc.id
}

resource "aws_route_table" "cap-route-table" {
  vpc_id = aws_vpc.cap-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cap-internet-gateway.id
  }
}

resource "aws_route_table_association" "cap_route_table_association" {
  route_table_id = aws_route_table.cap-route-table.id
  subnet_id = aws_subnet.public-subnet.id
}

resource "aws_instance" "app_server" {
  ami           = "ami-03d8b47244d950bbb"
  subnet_id = aws_subnet.public-subnet.id
  instance_type = "t3.nano"

  tags = {
    Name = "SampleServer"
  }
}