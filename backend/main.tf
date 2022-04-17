provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "d1b77e00-e3e9-4a58-8f0d-6bf768c6e869"
  }
}