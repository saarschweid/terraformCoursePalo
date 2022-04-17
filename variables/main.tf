variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["value1", "value2"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the VPC name"
}

provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = var.inputname
    yor_trace = "3a76a26f-b722-45fc-ba99-4ac872de89da"
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}
