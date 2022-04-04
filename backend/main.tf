provider "aws" {
  region = "us-east-1"
  profile = "dev2"
}

resource "aws_vpc" "test" {
    cidr_block = "10.0.0.0/16"
}