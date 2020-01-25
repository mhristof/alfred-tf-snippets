data "aws_customer_gateway" "foo" {
    filter {
        name = "tag:Name"
    values = ["foo-prod"]
    }
}

resource "aws_vpn_gateway" "main" {
    vpc_id          = "${aws_vpc.main.id}"
    amazon_side_asn = 7224
}

resource "aws_vpn_connection" "transit" {
    vpn_gateway_id      = "${aws_vpn_gateway.main.id}"
    customer_gateway_id = "${data.aws_customer_gateway.foo.id}"
    type                = "${data.aws_customer_gateway.foo.type}"
    static_routes_only  = false
}
