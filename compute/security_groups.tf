# Security group for public ssh connection

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_ssh.id
}


# Security group for private ssh connection and port 3000

resource "aws_security_group" "allow_ssh_3000" {
  name        = "allow_ssh_3000"
  description = "Allow ssh and port 3000 inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_ssh_3000"
  }
}

resource "aws_security_group_rule" "private_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr_block]
  security_group_id = aws_security_group.allow_ssh_3000.id
}

resource "aws_security_group_rule" "private_in_3000" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr_block]
  security_group_id = aws_security_group.allow_ssh_3000.id
}


 # security group for rds

 resource "aws_security_group" "db_sg" {
   name = "db_sg"
   description = "security group for database"
   vpc_id = var.vpc_id
   tags = {
     "Name" = "db_sg"
   }
 }

 resource "aws_security_group_rule" "db_sg_rule" {
  type              = "ingress"
  description       = "allow traffic from only the app" 
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr_block]
  security_group_id = aws_security_group.db_sg.id
}




