variable "action" {
  description = "The action to be applied by the plan."
  default = "deployment"
}

variable "aws_access_key" {
  description = "AWS Access Key."
  # default = "AKIAIX3DNBYFKAC3H4QA"
}

variable "aws_secret_key" {
  description = "AWS Secret Key."
  # default = "Z35CuPGjgASafrbmUl25OOnF9r6iPQbnxRYMUlJw"
}

variable "private_key_path" {
  description = "The private key file that will be deployed to compute instances to access them through ssh."
  default = "hellowebui_key.pem"
}

variable "key_name" {
  description = "Key name in AWS key registry that maps the private key file."
  default = "hellowebui_key"
}
variable "network_address_space" {
  description = "Range of network addresses."
  default = "10.1.0.0/16"
}
variable "subnet1_address_space" {
  description = "Range of network addresses in the first subnet."
  default = "10.1.0.0/24"
}
variable "subnet2_address_space" {
  description = "Range of network addresses in the second subnet."
  default = "10.1.1.0/24"
}

variable "AMI" {
  description = "AMI to be use as base for the EC2 instance to be deployed."
  # default = "ami-02b903ec661da0938"
}

variable "stackname" {
  description = "Name for grouping the set of resources deployed."
  # default = "hellowebui-modules"
}

variable "environment" {
  description = "Environment name to be deployed."
  # default = "hellowebui-modules"
}