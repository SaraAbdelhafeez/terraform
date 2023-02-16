resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.sprints_vpc.id
  cidr_block = var.public_subnet_cidr
  tags = {
    "Name" = "sprints_public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.sprints_vpc.id
  cidr_block = var.private_subnet_cidr
  tags = {
    "Name" = "sprints_private_subnet"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.sprints_vpc.id
  cidr_block = var.private_subnet2_cidr
  tags = {
    "Name" = "sprints_private_subnet2"
  }
}