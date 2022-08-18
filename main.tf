provider "aws" {
  region = "us-east-1"

}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "prod-subnet"
  }
}

resource "aws_instance" "my-first-server" {
  ami = "ami-0729e439b6769d6ab"
  instance_type = "t2.micro"
  tags = {
    "Name" = "1st-terraform-srv"
  }
}