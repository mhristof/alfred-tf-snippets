data "aws_vpn_gateway" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpn-gw"]
  }
}

output "vpn_gateway_id" {
  value = "${data.aws_vpn_gateway.selected.id}"
}
