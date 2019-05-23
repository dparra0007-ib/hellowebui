# aws_access_key = "AKIAIX3DNBYFKAC3H4QA"
# aws_secret_key = "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"
# private_key_path = "hellowebui_key.pem"

variable "aws_access_key" {
  default = "AKIAIX3DNBYFKAC3H4QA"
}

variable "aws_secret_key" {
  default = "Z35CuPGjgASafrbmUl25OOnF9r6iPQbnxRYMUlJw"
}

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