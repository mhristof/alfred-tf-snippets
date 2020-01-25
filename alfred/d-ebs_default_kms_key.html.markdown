data "aws_ebs_default_kms_key" "current" { }

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"

  encrypted         = true
  kms_key_id        = "${data.aws_ebs_default_kms_key.current.key_arn}"

}
