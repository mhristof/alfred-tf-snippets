data "aws_ec2_transit_gateway_vpc_attachment" "example" {
  filter {
    name   = "vpc-id"
    values = ["vpc-12345678"]
  }
}

data "aws_ec2_transit_gateway_vpc_attachment" "example" {
  id = "tgw-attach-12345678"
}
