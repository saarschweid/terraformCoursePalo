provider "aws" {
  region = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "db" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
      Name = "DB Server"
  }
}

resource "aws_instance" "web" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]  
  user_data = file("server-script.sh")
  tags = {
      Name = "Web Server"
  }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}

variable "ingressrules" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egressrules" {
  type = list(number)
  default = [ 80,443]
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}

output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}

resource "aws_security_group" "web_traffic" {
  name = "Allow Web Traffic"

  dynamic "ingress"  {
      iterator = port
      for_each = var.ingressrules
      content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }

  dynamic "egress"  {
      iterator = port
      for_each = var.egressrules
      content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }
}