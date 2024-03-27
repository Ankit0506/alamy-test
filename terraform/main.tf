provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet1" {
  vpc_id           = aws_vpc.my_vpc.id
  cidr_block       = var.subnet1_cidr_block
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "subnet2" {
  vpc_id           = aws_vpc.my_vpc.id
  cidr_block       = var.subnet2_cidr_block
  availability_zone = "${var.region}b"
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  count         = 2
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  key_name      = var.key_name
  security_group_ids = [aws_security_group.my_security_group.id]
}
