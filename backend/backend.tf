terraform {
  backend "s3" {
      key = "terraform/tfstate.tfstate"
      bucket = "some-bucket"
      region = "us-east-1"
      access_key = ""
      secret_key = ""
  }
}   