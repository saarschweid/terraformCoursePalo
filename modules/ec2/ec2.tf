
variable "ec2name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    Name      = var.ec2name
    yor_trace = "a953849f-ec79-416f-8a43-538e2db1c92b"
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}