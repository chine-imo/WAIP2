variable "region" {
  default = "eu-west-2"
}

variable "vpc-cidr" {
  default     = "172.28.0.0/16"
  description = "vpc_cidr"
}

variable "jenkins-subnet-cidr" {
  default     = "172.28.8.0/24"
  description = "weather subnet cidr"
}

variable "key_name" {
  default = "terraform2"
}

variable "private_key" {
  default = "~/.ssh/terraform2.pem"
}

variable "jenkins-ami" {
  default = "ami-032598fcc7e9d1c7a"
}

