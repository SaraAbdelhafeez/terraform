output "vpc_cidr" {
  value = var.vpc_cidr
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}

output "vpc_id" {
  value = aws_vpc.sprints_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.sprints_vpc.cidr_block
}