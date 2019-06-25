##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  region     = "us-west-1"
}

##################################################################################
# LOCALS
##################################################################################

locals {
  test_size = "${var.action == "test" ? 1 : 0}"
}

##################################################################################
# MODULES
##################################################################################

##################################################################################
# DATA
##################################################################################

##################################################################################
# RESOURCES
##################################################################################

# INSTANCES #
resource "aws_instance" "coreinstance" {
  ami           = "${var.AMI}"
  instance_type = "t2.micro"
  subnet_id     = "${var.subnet1_id}"
  vpc_security_group_ids = ["${var.nginx-sg_id}"]
  key_name        = "${var.key_name}"

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  tags = {
    Role = "Core Instance"
    environment = "${var.environment}"
    stackname = "${var.stackname}"
    logicalid = "EC2Instance"
  }
}

resource "aws_instance" "testinstance" {
  count = "${local.test_size}"
  ami           = "ami-074e2d6769f445be5"
  instance_type = "t2.micro"
  subnet_id     = "${var.subnet1_id}"
  vpc_security_group_ids = ["${var.nginx-sg_id}"]
  key_name        = "${var.key_name}"

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  tags = {
    Role = "Test Instance"
    environment = "${var.environment}"
    stackname = "${var.stackname}"
    logicalid = "EC2Instance"
  }
}