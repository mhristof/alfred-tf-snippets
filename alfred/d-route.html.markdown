variable "subnet_id" {}

data "aws_route_table" "selected" {
  subnet_id = "${var.subnet_id}"
}

data "aws_route" "route" {
  route_table_id         = "${aws_route_table.selected.id}"
  destination_cidr_block = "10.0.1.0/24"
}

data "aws_network_interface" "interface" {
  network_interface_id = "${data.aws_route.route.network_interface_id}"
}
