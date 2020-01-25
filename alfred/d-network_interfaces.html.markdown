data "aws_network_interfaces" "example" {}

output "example" {
  value = "${data.aws_network_interfaces.example.ids}"
}

data "aws_network_interfaces" "example" {
  tags = {
    Name = "test"
  }
}

output "example1" {
  value = "${data.aws_network_interfaces.example.ids}"
}

data "aws_network_interfaces" "example" {
  filter {
    name   = "subnet-id"
    values = ["${aws_subnet.test.id}"]
  }
}

output "example" {
  value = "${data.aws_network_interfaces.example.ids}"
}
