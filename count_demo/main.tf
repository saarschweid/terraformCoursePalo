provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  count         = 3
  tags = {
    yor_trace = "f8c61e6b-31df-4276-aed9-602771297724"
  }
}