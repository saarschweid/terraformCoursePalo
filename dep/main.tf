provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "db" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    yor_trace = "11d0c6f3-8068-4c6a-8fcb-1111ea26d785"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  depends_on = [
    aws_instance.db
  ]
  tags = {
    yor_trace = "2df15503-63f6-471e-8801-b44a4f8a9ff8"
  }
}

data "aws_instance" "dbsearch" {
  filter {
    name   = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}