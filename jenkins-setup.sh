#! /bin/bash
#Filename: setup.sh
#Description: installs required programs and dependendies

sudo yum update -y
sudo yum install -y git
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum upgrade -y
sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install -y maven
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.amzn2.0.1.x86_64' >> ~/.bashrc
sudo echo 'export M2_HOME=/usr/share/maven' >> ~/.bashrc
sudo echo 'export MAVEN_HOME=/usr/share/maven' >> ~/.bashrc
sudo echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.bashrc
sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
sudo yum install -y jenkins
wget https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip
sudo unzip packer_1.6.0_linux_amd64.zip -d /usr/bin
sudo echo 'export PATH=/usr/bin/packer:$PATH' >> ~/.bashrc
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
sudo unzip terraform_0.12.26_linux_amd64.zip -d /usr/bin
sudo echo 'export PATH=/usr/bin/terraform:$PATH' >> ~/.bashrc
source .bashrc
usermod --shell /bin/bash jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo mkdir chine_provisioner.txt

