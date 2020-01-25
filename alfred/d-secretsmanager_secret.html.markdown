data "aws_secretsmanager_secret" "by-arn" {
  arn = "arn:aws:secretsmanager:us-east-1:123456789012:secret:example-123456"
}

data "aws_secretsmanager_secret" "by-name" {
  name = "example"
}
