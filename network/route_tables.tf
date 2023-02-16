# public route table configuration

resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.sprints_vpc.id
  tags = {
    "Name" = "sprints_public_table"
  }

}

resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.sprints_gw.id
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_table.id
}

# private route table configuration

resource "aws_route_table" "private_table" {
  vpc_id = aws_vpc.sprints_vpc.id
  tags = {
    "Name" = "sprints_private_table"
  }

}


resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_table.id
}



resource "aws_route_table_association" "private_route_association2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_table.id
  
}