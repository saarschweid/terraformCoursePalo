resource "aws_instance" "db" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
      Name = "DB Server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}