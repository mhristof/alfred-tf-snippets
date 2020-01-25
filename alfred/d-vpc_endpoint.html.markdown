# Declare the data source
data "aws_vpc_endpoint" "s3" {
  vpc_id       = "${aws_vpc.foo.id}"
  service_name = "com.amazonaws.us-west-2.s3"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  vpc_endpoint_id = "${data.aws_vpc_endpoint.s3.id}"
  route_table_id  = "${aws_route_table.private.id}"
}
