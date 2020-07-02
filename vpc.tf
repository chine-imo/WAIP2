provider "aws" {
  region = var.region
}

resource "aws_vpc" "weather_vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "weather-vpc"
  }
}