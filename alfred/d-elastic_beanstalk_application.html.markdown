data "aws_elastic_beanstalk_application" "example" {
  name = "example"
}

output "arn" {
  value = "${data.aws_elastic_beanstalk_application.example.arn}"
}

output "description" {
  value = "${data.aws_elastic_beanstalk_application.example.description}"
}
