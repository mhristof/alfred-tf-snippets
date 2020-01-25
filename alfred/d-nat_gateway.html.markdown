variable "subnet_id" {}

data "aws_nat_gateway" "default" {
  subnet_id = "${aws_subnet.public.id}"
}

data "aws_nat_gateway" "default" {
  subnet_id = "${aws_subnet.public.id}"

  tags = {
    Name = "gw NAT"
  }
}
