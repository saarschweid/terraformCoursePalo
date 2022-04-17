provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "2eb1fee3-ee79-4c37-a85e-7b64c262a7b6"
  }
}