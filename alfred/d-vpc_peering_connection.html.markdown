# Declare the data source
data "aws_vpc_peering_connection" "pc" {
  vpc_id          = "${aws_vpc.foo.id}"
  peer_cidr_block = "10.0.1.0/22"
}

# Create a route table
resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.foo.id}"
}

# Create a route
resource "aws_route" "r" {
  route_table_id            = "${aws_route_table.rt.id}"
  destination_cidr_block    = "${data.aws_vpc_peering_connection.pc.peer_cidr_block}"
  vpc_peering_connection_id = "${data.aws_vpc_peering_connection.pc.id}"
}
