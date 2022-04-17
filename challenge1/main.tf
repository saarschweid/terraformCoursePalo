provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_vpc" "challenge1vpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name      = "TerraformVPC"
    yor_trace = "48ccfba8-e39b-42cf-9fb6-af3f00100bd3"
  }
}