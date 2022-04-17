provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "825578c6-4b52-4ba2-9d40-2a5ac6a56685"
  }
}

resource "aws_vpc" "myvpc2" {
  cidr_block = "192.168.0.0/24"
  tags = {
    yor_trace = "66b5c699-635c-4d7e-8633-ee8aeda305d2"
  }
}