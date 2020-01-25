data "aws_route_tables" "rts" {
  vpc_id = "${var.vpc_id}"

  filter {
    name   = "tag:kubernetes.io/kops/role"
    values = ["private*"]
  }
}

resource "aws_route" "r" {
  count                     = "${length(data.aws_route_tables.rts.ids)}"
  route_table_id            = "${data.aws_route_tables.rts.ids[count.index]}"
  destination_cidr_block    = "10.0.1.0/22"
  vpc_peering_connection_id = "pcx-0e9a7a9ecd137dc54"
}
