terraform {
  backend "s3" {
    bucket = "ib-terraform-backend"
    region = "us-west-1"
  }
}