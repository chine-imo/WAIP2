resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.weather_vpc.id
  cidr_block        = var.jenkins-subnet-cidr
  availability_zone = "eu-west-2a"

  tags = {
    Name = "public-subnet-1"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.weather_vpc.id
  cidr_block        = var.nginx-proxy-subnet-cidr
  availability_zone = "eu-west-2a"
  tags = {
    Name = "public-subnet-2"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.weather_vpc.id
  cidr_block        = var.private-subnet_1-cidr
  availability_zone = "eu-west-2b"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.weather_vpc.id
  cidr_block        = var.private-subnet_2-cidr
  availability_zone = "eu-west-2c"
  tags = {
    Name = "private-subnet-2"
  }
}