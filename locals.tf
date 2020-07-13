locals {
  sec_groups_pub = concat([aws_security_group.group_1.id])
}

locals {
  subs_pub = concat([aws_subnet.public_3.id], [aws_subnet.public_4.id])
}

locals {
  sec_groups_pub1 = concat([aws_security_group.group_2.id])
}

locals {
  sec_groups_pub2 = concat([aws_security_group.group_3.id])
}