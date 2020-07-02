# Jenkins box tag name
/*output "jenkins_tagName" {
  value = aws_instance.jenkins.tags.Name
}*/

# Jenkins box public ip
/*output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}*/

output "jenkins_public_ip" {
  value = "${
    formatlist(
      "%s:%s",
      aws_instance.jenkins.tags.Name,
      aws_instance.jenkins.public_ip
    )
  }"
}

# Jenkins box private ip
/*output "jenkins_private_ip" {
  value = aws_instance.jenkins.private_ip
}*/

output "jenkins_private_ip" {
  value = "${
    formatlist(
      "%s:%s",
      aws_instance.jenkins.tags.Name,
      aws_instance.jenkins.private_ip
    )
  }"
}


