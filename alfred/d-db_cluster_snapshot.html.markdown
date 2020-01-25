data "aws_db_cluster_snapshot" "development_final_snapshot" {
  db_cluster_identifier = "development_cluster"
  most_recent           = true
}

# Use the last snapshot of the dev database before it was destroyed to create
# a new dev database.
resource "aws_rds_cluster" "aurora" {
  cluster_identifier   = "development_cluster"
  snapshot_identifier  = "${data.aws_db_cluster_snapshot.development_final_snapshot.id}"
  db_subnet_group_name = "my_db_subnet_group"

  lifecycle {
    ignore_changes = ["snapshot_identifier"]
  }
}

resource "aws_rds_cluster_instance" "aurora" {
  cluster_identifier   = "${aws_rds_cluster.aurora.id}"
  instance_class       = "db.t2.small"
  db_subnet_group_name = "my_db_subnet_group"
}
