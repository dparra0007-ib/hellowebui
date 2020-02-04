terraform {
  backend "s3" {
    bucket = "iagtech-terraform-backend"
    region = "us-west-1"
  }
}