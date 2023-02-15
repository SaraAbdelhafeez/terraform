data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "bastion"
  }
  provisioner "local-exec" { 
    command = "echo '${aws_instance.bastion.public_ip}'"
  }
}

resource "aws_network_interface_sg_attachment" "bastion_sg_attachment" {
  security_group_id    = aws_security_group.allow_ssh.id
  network_interface_id = aws_instance.bastion.primary_network_interface_id
}


resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  key_name = var.key_name
  associate_public_ip_address = false
  tags = {
    Name = "application"
  }
}

resource "aws_network_interface_sg_attachment" "application_sg_attachment" {
  security_group_id    = aws_security_group.allow_ssh_3000.id
  network_interface_id = aws_instance.application.primary_network_interface_id
}