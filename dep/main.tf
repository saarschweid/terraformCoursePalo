provider "aws" {
  region = "us-east-1"
  profile = "dev2"
}

resource "aws_instance" "db" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"

    depends_on = [
      aws_instance.db
    ]
}

data "aws_instance" "dbsearch" {
    filter {
        name = "tag:Name"
        values = ["DB Server"]
    }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}