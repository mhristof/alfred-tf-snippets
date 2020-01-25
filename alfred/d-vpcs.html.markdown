data "aws_vpcs" "foo" {
  tags = {
    service = "production"
  }
}

output "foo" {
  value = "${data.aws_vpcs.foo.ids}"
}

data "aws_vpcs" "foo" {}

resource "aws_flow_log" "test_flow_log" {
  count = "${length(data.aws_vpcs.foo.ids)}"

  # ...
  vpc_id = "${element(data.aws_vpcs.foo.ids, count.index)}"

  # ...
}

output "foo" {
  value = "${data.aws_vpcs.foo.ids}"
}
