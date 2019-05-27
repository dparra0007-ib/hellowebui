variable "action_on_environment" {
  type = "map"
  default = {
    deployment = "deployment"
    functional_test = "functional_test"
    performance_test = "performance_test"
    regresstion_test = "regresstion_test"
  }
}

variable "action" {}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "private_key_path" {
  default = "hellowebui_key.pem"
}

variable "key_name" {
  default = "hellowebui_key"
}
variable "network_address_space" {
  default = "10.1.0.0/16"
}
variable "subnet1_address_space" {
  default = "10.1.0.0/24"
}
variable "subnet2_address_space" {
  default = "10.1.1.0/24"
}

variable "AMI" {}

variable "stackname" {}

variable "environment" {}