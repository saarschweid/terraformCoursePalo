provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  count         = var.number_of_servers
  tags = {
    yor_trace = "80fedbf8-5cdd-4705-81c6-2cdf824ddf2d"
  }
}