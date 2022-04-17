provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    yor_trace = "f09241e6-8af5-4620-8929-a0a33522101f"
  }
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
  tags = {
    yor_trace = "1ba5ec8f-9465-45f4-a4b1-b06070fb3fec"
  }
}

output "EIP" {
  value = aws_eip.elasticeip.public_ip
}