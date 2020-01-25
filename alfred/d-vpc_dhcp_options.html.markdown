data "aws_vpc_dhcp_options" "example" {
  dhcp_options_id = "dopts-12345678"
}

data "aws_vpc_dhcp_options" "example" {
  filter {
    name   = "key"
    values = ["domain-name"]
  }

  filter {
    name   = "value"
    values = ["example.com"]
  }
}
