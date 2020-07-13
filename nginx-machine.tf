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

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/terraform2.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1.12 -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo useradd -d /var/lib/jenkins jenkins",
      "sudo usermod -aG wheel jenkins",
      "sudo usermod --shell /bin/bash jenkins",
      "sudo mkdir /etc/nginx/red-conf",
      "sudo cp /etc/nginx/nginx.conf red-conf/nginx.conf",
      "sudo mkdir /etc/nginx/blue-conf",
      "sudo cp /etc/nginx/nginx.conf blue-conf/nginx.conf"
    ]

  }

}

#the default location nginx looks in for the configuration file is /etc/nginx/nginx.conf, but you can pass in an arbitrary path with the -c flag. E.g.:
# nginx -c /etc/nginx/blue-conf

#Familiarize yourself with another command line flag -t, which just checks to make sure your configuration file works. Run nginx -t every time after modifying 
#your configuration file and it will spit out any syntax errors. To reload the configuration after changes, use nginx -s reload.


