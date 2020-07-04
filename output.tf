# Jenkins box tag name
output "jenkins_tagName" {
  value = aws_instance.jenkins.tags.Name
}

# Jenkins box public ip
output "jenkins_public_ip1" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_public_ip2" {
  value = "${
    formatlist(
      "%s:%s",
      #aws_instance.jenkins.tags.Name,
      "JENKINS_PUB_IP",
      aws_instance.jenkins.public_ip
    )
  }"
}

# Jenkins box private ip
output "jenkins_private_ip1" {
  value = aws_instance.jenkins.private_ip
}

output "jenkins_private_ip2" {
  value = "${
    formatlist(
      "%s:%s",
      aws_instance.jenkins.tags.Name,
      aws_instance.jenkins.private_ip
    )
  }"
}

# nginx tag name 
output "proxy_server_TagName" {
  value = aws_instance.nginx.tags.Name
}

# nginx public ip
output "proxy_server_public_ip" {
  value = aws_instance.nginx.public_ip
}

output "nginx_public_ip" {
  value = "${
    formatlist(
      "%s:%s",
      aws_instance.nginx.tags.Name,
      aws_instance.nginx.public_ip
    )
  }"
}

# nginx private ip
output "proxy_server_private_ip" {
  value = aws_instance.nginx.private_ip
}

output "nginx_private_ip" {
  value = "${
    formatlist(
      "%s:%s",
      aws_instance.nginx.tags.Name,
      aws_instance.nginx.private_ip
    )
  }"
}

# app server tag name
output "app_server_TagName" {
  value = aws_instance.app_machine.*.tags.Name
}

# app server private ip
output "app_server_private_ips" {
  value = aws_instance.app_machine.*.private_ip
}

output "app_machines_private_ips" {
  value = "${
    formatlist(
      "%s:%s",
      aws_instance.app_machine.*.tags.Name,
      aws_instance.app_machine.*.private_ip
    )
  }"
}


output "app_server_id" {
  value = {
    for instance in aws_instance.app_machine:
    instance.tags.Name => instance.private_ip
  }
}






#output "app_machine_" { value = ["${aws_instance.app_machine.*.tags.Name}","${aws_instance.app_machine.*.public_ip}"] }


/*output "jenkins_node_endpoint" {
  value = "http://${aws_instance.JenkinsBox.public_ip}:8080  To connect ssh -i key ec2-user@${aws_instance.JenkinsBox.public_ip}"
}*/

# https://medium.com/hashicorp-engineering/introduction-a9c8530ce482