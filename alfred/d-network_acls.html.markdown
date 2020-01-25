data "aws_network_acls" "example" {
  vpc_id = "${var.vpc_id}"
}

output "example" {
  value = "${data.aws_network_acls.example.ids}"
}

data "aws_network_acls" "example" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Tier = "Private"
  }
}

data "aws_network_acls" "example" {
  vpc_id = "${var.vpc_id}"

  filter {
    name   = "association.subnet-id"
    values = ["${aws_subnet.test.id}"]
  }
}
