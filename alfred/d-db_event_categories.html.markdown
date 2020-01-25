data "aws_db_event_categories" "example" {}

output "example" {
  value = "${data.aws_db_event_categories.example.event_categories}"
}

data "aws_db_event_categories" "example" {
  source_type = "db-snapshot"
}

output "example" {
  value = "${data.aws_db_event_categories.example.event_categories}"
}
