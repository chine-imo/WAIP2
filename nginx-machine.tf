resource "aws_instance" "nginx" {
  #ami                    = data.aws_ami.nginx_packer_image.id
  ami                    = var.proxy-server-ami
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_2.id
  vpc_security_group_ids = local.sec_groups_pub1

  tags = {
    Name = "proxy-nginx-server"
  }

  /*connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/terraform2.pem")
    host        = self.public_ip
  }*/

  /*provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y yum-utils",
      "sudo amazon-linux-extras install nginx1.12 -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]

  }*/

}


