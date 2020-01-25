data "aws_cloudtrail_service_account" "main" {}

resource "aws_s3_bucket" "bucket" {
  bucket        = "tf-cloudtrail-logging-test-bucket"
  force_destroy = true

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "Put bucket policy needed for trails",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.aws_cloudtrail_service_account.main.arn}"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::tf-cloudtrail-logging-test-bucket/*"
    },
    {
      "Sid": "Get bucket policy needed for trails",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.aws_cloudtrail_service_account.main.arn}"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::tf-cloudtrail-logging-test-bucket"
    }
  ]
}
EOF
}
