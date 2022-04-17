provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    yor_trace = "6e4b2168-85e6-4d09-8fa1-2a9b50704456"
  }
}