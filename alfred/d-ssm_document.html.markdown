data "aws_ssm_document" "foo" {
  name            = "AWS-GatherSoftwareInventory"
  document_format = "YAML"
}

output "content" {
  value = "${data.aws_ssm_document.foo.content}"
}

data "aws_ssm_document" "test" {
  name            = "${aws_ssm_document.test.name}"
  document_format = "JSON"
}
