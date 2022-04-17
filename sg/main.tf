provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "ec2" {
  ami             = "ami-0c02fb55956c7d316"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  tags = {
    yor_trace = "5834fa90-d73d-42e6-b92d-89e435f79a0f"
  }
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "4cadf461-8497-4492-95b0-fb4bd721f7a0"
  }
}