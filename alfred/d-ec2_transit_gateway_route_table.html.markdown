data "aws_ec2_transit_gateway_route_table" "example" {
  filter {
    name   = "default-association-route-table"
    values = ["true"]
  }

  filter {
    name   = "transit-gateway-id"
    values = ["tgw-12345678"]
  }
}

data "aws_ec2_transit_gateway_route_table" "example" {
  id = "tgw-rtb-12345678"
}
