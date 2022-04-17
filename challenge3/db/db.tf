resource "aws_instance" "db" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name      = "DB Server"
    yor_trace = "b4a3183a-6f47-4a2a-81f6-db81d812fbb8"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}