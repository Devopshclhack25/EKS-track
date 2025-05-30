#Terrform settings
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

#Public Subnet
resource "aws_subnet" "pb_subnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.1.0/24"  
  availability_zone = "us-east-1a" 
  tags = {
    Name = "public-subnet-az1"
  }
}

#Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.2.0/24" 
  availability_zone = "us-east-1a" 
  tags = {
    Name = "private-subnet-az1"
  }
}
