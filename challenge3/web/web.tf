resource "aws_instance" "web" {
  ami             = "ami-0c02fb55956c7d316"
  instance_type   = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data       = file("./web/server-script.sh")
  tags = {
    Name      = "Web Server"
    yor_trace = "08dc71ac-6b06-4ad7-a657-6abe20dfe9c5"
  }
}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source      = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"
}