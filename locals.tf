locals {
  sec_groups_pub = concat([aws_security_group.group_1.id])
}