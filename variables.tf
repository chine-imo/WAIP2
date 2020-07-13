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

variable "jenkins-ami" {
  default = "ami-032598fcc7e9d1c7a"
  #default = "ami-0cf94b1c148cb4b81"
}

variable "app-server-ami" {
  default = "ami-032598fcc7e9d1c7a"
  #default = "ami-0cf94b1c148cb4b81"
}

variable "proxy-server-ami" {
  default = "ami-032598fcc7e9d1c7a"
  #default = "ami-0cf94b1c148cb4b81"
}

variable "private_key" {
  default = "~/.ssh/terraform2.pem"
}

variable "nginx-proxy-subnet-cidr" {
  default     = "172.28.16.0/24"
  description = "nginx-proxy-subnet-cidr"
}

variable "public-subnet_3-cidr" {
  default     = "172.28.24.0/24"
  description = "public-subnet_3-cidr"
}

variable "public-subnet_4-cidr" {
  default     = "172.28.32.0/24"
  description = "public-subnet_4-cidr"
}

variable "instance_names" {
  description = "names for the ec2 instances to be used as app servers"
  type        = list(string)
  default     = ["Red-Box", "Blue-Box"]
}

