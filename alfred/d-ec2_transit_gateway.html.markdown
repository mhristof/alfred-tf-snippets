data "aws_ec2_transit_gateway" "example" {
  filter {
    name   = "options.amazon-side-asn"
    values = ["64512"]
  }
}

data "aws_ec2_transit_gateway" "example" {
  id = "tgw-12345678"
}
