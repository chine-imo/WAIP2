/*data "aws_ami" "jenkins_packer_image" {
  most_recent = true
  filter {
    name   = "name"
    values = ["jenkins-packed-ami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"]
}*/