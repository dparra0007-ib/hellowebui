##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  region     = "us-west-1"
}

##################################################################################
# LOCALS
##################################################################################


##################################################################################
# MODULES
##################################################################################

module "vpc" {
  source = "git::https://gitlab.com/david-parra/iag/terraform-modules/vpc.git"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
}

module "ec2" {
  source = "./modules/ec2"

  aws_access_key    = "${var.aws_access_key}"
  aws_secret_key    = "${var.aws_secret_key}"
  AMI               = "${var.AMI}"
  key_name          = "${var.key_name}"
  private_key_path  = "${var.private_key_path}"
  environment       = "${var.environment}"
  stackname         = "${var.stackname}"
  action            = "${var.action}"
  subnet1_id        = "${module.vpc.subnet1_id}"
  subnet2_id        = "${module.vpc.subnet2_id}"
  nginx-sg_id       = "${module.vpc.nginx-sg_id}"
}

##################################################################################
# DATA
##################################################################################

##################################################################################
# RESOURCES
##################################################################################
