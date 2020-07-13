resource "aws_instance" "app_machine" {
  ami = data.aws_ami.java_packer_image.id
  #ami                    = var.app-server-ami
  instance_type          = "t2.micro"
  key_name               = var.key_name
  count                  = length(var.instance_names)
  subnet_id              = element(local.subs_pub, count.index + 1)
  vpc_security_group_ids = local.sec_groups_pub2

  /*tags = {
    Name = element(var.instance_name, count.index + 1)
  }*/

  tags = {
    Name = var.instance_names[count.index]
  }

    connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y java-1.8.0-openjdk-devel",
      "sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.amzn2.0.1.x86_64/' >> ~/.bashrc",
      "sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc",
      "sudo useradd -d /var/lib/jenkins jenkins",
      "sudo usermod -aG wheel jenkins",
      "sudo usermod --shell /bin/bash jenkins"      
    ]
  }



}



