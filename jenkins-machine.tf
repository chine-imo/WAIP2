resource "aws_instance" "jenkins" {
  #ami = data.aws_ami.jenkins_packer_image.id
  ami                    = var.jenkins-ami
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = local.sec_groups_pub
  

  tags = {
    Name = "weather-jenkins"
  }

  /*connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y git",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo yum upgrade -y",
      "sudo yum install -y java-1.8.0-openjdk-devel",
      "wget https://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz",
      "sudo mkdir /opt/Maven",
      "sudo tar -xzvf apache-maven-3.6.3-bin.tar.gz --directory /opt/Maven",
      "sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.amzn2.0.1.x86_64' >> ~/.bashrc",
      "sudo echo 'export M2_HOME=/opt/Maven/apache-maven-3.6.3' >> ~/.bashrc",
      "sudo echo 'export MAVEN_HOME=/opt/Maven/apache-maven-3.6.3' >> ~/.bashrc",
      "sudo echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.bashrc",
      "sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc",
      "sudo yum install -y jenkins",
      "wget https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip",
      "sudo unzip packer_1.6.0_linux_amd64.zip -d /usr/bin",
      "sudo echo 'export PATH=/usr/bin/packer:$PATH' >> ~/.bashrc",
      "wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip",
      "sudo unzip terraform_0.12.26_linux_amd64.zip -d /usr/bin",
      "sudo echo 'export PATH=/usr/bin/terraform:$PATH' >> ~/.bashrc",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo mkdir chine_provisioner.txt"
    ]

  }*/
}

