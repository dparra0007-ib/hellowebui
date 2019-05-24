terraform {
  backend "s3" {
    bucket = "iaggbs-terraform-backend"
    region = "us-west-1"
    key = "hellowevui-staging"
  }
}