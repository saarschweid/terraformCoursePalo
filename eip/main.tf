provider "aws" {
  region = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "ec2" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}