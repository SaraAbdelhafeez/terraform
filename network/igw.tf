resource "aws_internet_gateway" "sprints_gw" {
  vpc_id = aws_vpc.sprints_vpc.id

  tags = {
    Name = "sprints_gw"
  }
}

# resource "aws_internet_gateway_attachment" "igw_attachment" {
#   internet_gateway_id = aws_internet_gateway.sprints_gw.id
#   vpc_id              = aws_vpc.sprints_vpc.id
# }