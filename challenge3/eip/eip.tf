variable "instance_id" {
  type = string
}

resource "aws_eip" "web_ip" {
  instance = var.instance_id
  tags = {
    yor_trace = "05d4bb36-530c-48de-94b0-57c61e988196"
  }
}

output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}