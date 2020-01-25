data "aws_secretsmanager_secret_version" "example" {
  secret_id = "${data.aws_secretsmanager_secret.example.id}"
}

data "aws_secretsmanager_secret_version" "by-version-stage" {
  secret_id     = "${data.aws_secretsmanager_secret.example.id}"
  version_stage = "example"
}

output "example" {
  value = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)["key1"]
}
