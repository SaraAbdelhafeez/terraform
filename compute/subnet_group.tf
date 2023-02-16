resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.private_subnet_id, var.private_subnet2_id]

  tags = {
    Name = "My DB subnet group"
  }
}