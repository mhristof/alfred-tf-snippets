resource "aws_network_acl" "bar" {
  vpc_id = "${aws_vpc.foo.id}"
}

resource "aws_network_acl_rule" "bar" {
  network_acl_id = "${aws_network_acl.bar.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_block = # add a CIDR block here
  from_port      = 22
  to_port        = 22
}
