resource "aws_organizations_policy_attachment" "account" {
  policy_id = "${aws_organizations_policy.example.id}"
  target_id = "123456789012"
}

resource "aws_organizations_policy_attachment" "root" {
  policy_id = "${aws_organizations_policy.example.id}"
  target_id = "${aws_organizations_organization.example.roots.0.id}"
}

resource "aws_organizations_policy_attachment" "unit" {
  policy_id = "${aws_organizations_policy.example.id}"
  target_id = "${aws_organizations_organizational_unit.example.id}"
}
