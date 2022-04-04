provider "aws" {
  region = "us-east-1"
  profile = "dev2"
}

resource "aws_db_instance" "myRDS" {
    name = "myDB"
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.2.21"
    username = "saar"
    password = "password123"
    port = 3386
    allocated_storage = 20
    skip_final_snapshot = true
}