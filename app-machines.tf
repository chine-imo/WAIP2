resource "aws_instance" "app_machine" {
  #ami                    = data.aws_ami.java_packer_image.id
  ami                    = var.app-server-ami
  instance_type          = "t2.micro"
  key_name               = var.key_name
  count                  = length(var.instance_names)
  subnet_id              = element(local.subs_pri, count.index + 1)
  vpc_security_group_ids = local.sec_groups_pub2

  /*tags = {
    Name = element(var.instance_name, count.index + 1)
  }*/

  tags = {
    Name = var.instance_names[count.index]
  }



}



