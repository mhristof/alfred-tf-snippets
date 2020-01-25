resource "aws_db_instance" "prod" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.6.17"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "bar"
  db_subnet_group_name = "my_database_subnet_group"
  parameter_group_name = "default.mysql5.6"
}

data "aws_db_snapshot" "latest_prod_snapshot" {
  db_instance_identifier = "${aws_db_instance.prod.id}"
  most_recent            = true
}

# Use the latest production snapshot to create a dev instance.
resource "aws_db_instance" "dev" {
  instance_class      = "db.t2.micro"
  name                = "mydbdev"
  snapshot_identifier = "${data.aws_db_snapshot.latest_prod_snapshot.id}"

  lifecycle {
    ignore_changes = ["snapshot_identifier"]
  }
}
