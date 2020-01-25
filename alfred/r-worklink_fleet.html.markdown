resource "aws_worklink_fleet" "example" {
  name = "terraform-example"
}

resource "aws_worklink_fleet" "example" {
  name = "terraform-example"

  network {
    vpc_id             = "${aws_vpc.test.id}"
    subnet_ids         = ["${aws_subnet.test.*.id}"]
    security_group_ids = ["${aws_security_group.test.id}"]
  }
}

resource "aws_worklink_fleet" "test" {
  name = "tf-worklink-fleet-%s"

  identity_provider {
    type          = "SAML"
    saml_metadata = "${file("saml-metadata.xml")}"
  }
}
