data "aws_ec2_transit_gateway_vpn_attachment" "example" {
  transit_gateway_id = "${aws_ec2_transit_gateway.example.id}"
  vpn_connection_id  = "${aws_vpn_connection.example.id}"
}
