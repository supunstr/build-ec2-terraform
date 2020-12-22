provider "aws" {
    profile = "default"
    region = "us-east-1"
}

# Create new VPC
resource "aws_vpc" "dev_vpc" {
    cidr_block = "20.0.0.0/16"

    tags = {
      "Name" = "dev_vpc"
    }
}

# Add new subnet
resource "aws_subnet" "web" {
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = "20.0.1.0/24"

    tags = {
      "Name" = "web-subset"
    }
}

# build new VM
resource "aws_instance" "dev" {
    ami = "ami-096fda3c22c1c990a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.web.id

    tags = {
      "Name" = "dev01"
    }
}

