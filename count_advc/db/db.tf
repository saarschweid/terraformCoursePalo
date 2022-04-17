variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  count         = length(var.server_names)
  tags = {
    Name      = var.server_names[count.index]
    yor_trace = "fc39d728-ece8-4008-b7a9-d9e5f9021a78"
  }
}

output "PrivateIP" {
  value = [aws_instance.db.*.private_ip]
}