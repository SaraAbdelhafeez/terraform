resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot = true
  apply_immediately = true
  db_subnet_group_name = aws_db_subnet_group.default.id
  vpc_security_group_ids = [ aws_security_group.db_sg.id ]
}
