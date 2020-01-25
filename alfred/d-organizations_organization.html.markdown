# Terraform 0.12 syntax
data "aws_organizations_organization" "example" {}

output "account_ids" {
  value = data.aws_organizations_organization.example.accounts[*].id
}

data "aws_organizations_organization" "example" {}

resource "aws_sns_topic" "sns_topic" {
  name = "my-sns-topic"
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn = "${aws_sns_topic.sns_topic.arn}"

  policy = "${data.aws_iam_policy_document.sns_topic_policy.json}"
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect = "Allow"

    actions = [
      "SNS:Subscribe",
      "SNS:Publish",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"

      values = [
        "${data.aws_organizations_organization.example.id}",
      ]
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_sns_topic.sns_topic.arn}",
    ]
  }
}
