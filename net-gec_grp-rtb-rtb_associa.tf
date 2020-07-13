##############################################
##              Internet Gateway            ##
##############################################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.weather_vpc.id
  tags = {
    Name = "vpc-weather-igw"
  }
}



##############################################
##       Network Access Control List        ##
##############################################

resource "aws_network_acl" "nacl_b_all" {
  vpc_id = aws_vpc.weather_vpc.id

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    rule_no    = 2
    action     = "allow"
  }
  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    rule_no    = 1
    action     = "allow"
  }
  tags = {
    Name = "open_nacl"
  }
}



##############################################
##              Route Tables                ##
##############################################

resource "aws_route_table" "routetb_A_public" {
  vpc_id = aws_vpc.weather_vpc.id

  tags = {
    Name = "routetb_A_public"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

##############################################
##        Route Tables Association          ##
##############################################

resource "aws_route_table_association" "route-A-pub" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.routetb_A_public.id
}

resource "aws_route_table_association" "route-B-pub" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.routetb_A_public.id

}

resource "aws_route_table_association" "route-C-pub" {
  subnet_id      = aws_subnet.public_3.subnet_id
  route_table_id = aws_route_table.routetb_A_public.id
}

resource "aws_route_table_association" "route-D-pub" {
  subnet_id      = aws_subnet.public_4.subnet_id
  route_table_id = aws_route_table.routetb_A_public.id
}

##############################################
##            Security Groups               ##
##############################################

##### Sec group for Jenkins box #####
resource "aws_security_group" "group_1" {
  name        = "sec_group_1"
  description = "sec group for jenkins box"
  vpc_id      = aws_vpc.weather_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #uncomment below cidr_block and set to your ip address then comment out above cidr_block to restrict access to your address only !
    #cidr_blocks = ["0.0.0.0/0"] 


  }
  #set to enable github hooks access where access has been restricted to a single ip address
  #Git Hooks IP address
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["192.30.252.0/22"]
  }

  #Git Hooks IP address
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["185.199.108.0/22"]
  }

  #Git Hooks IP address
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["140.82.112.0/20"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


##### Sec group for proxy-server #####
resource "aws_security_group" "group_2" {
  name        = "sec_group_2"
  description = "sec group for proxy server servers"
  vpc_id      = aws_vpc.weather_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  /*ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }*/

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  /*egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.28.16.0/24"]
  }*/


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}



##### Sec group for app-server #####
resource "aws_security_group" "group_3" {
  name        = "sec_group_3"
  description = "sec group for app servers"
  vpc_id      = aws_vpc.weather_vpc.id

  /*ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    #cidr_blocks = [aws_instance.ec2-nginx-instance.*.private_ip/32]
    cidr_blocks = [var.vpc-cidr]    
  }*/

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.nginx-proxy-subnet-cidr]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.jenkins-subnet-cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = [var.vpc-cidr]

  }

  /*depends_on = [
    aws_instance.ec2-nginx-instance,
  ]*/
}