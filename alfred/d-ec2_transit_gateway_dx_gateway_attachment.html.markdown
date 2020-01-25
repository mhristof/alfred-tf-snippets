data "aws_ec2_transit_gateway_dx_gateway_attachment" "example" {
  transit_gateway_id = "${aws_ec2_transit_gateway.example.id}"
  dx_gateway_id      = "${aws_dx_gateway.example.id}"
}
