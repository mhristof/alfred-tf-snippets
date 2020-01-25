resource "aws_codedeploy_app" "example" {
  compute_platform = "ECS"
  name             = "example"
}

resource "aws_codedeploy_app" "example" {
  compute_platform = "Lambda"
  name             = "example"
}

resource "aws_codedeploy_app" "example" {
  compute_platform = "Server"
  name             = "example"
}
