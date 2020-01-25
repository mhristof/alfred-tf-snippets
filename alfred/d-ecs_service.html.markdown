data "aws_ecs_service" "example" {
  service_name = "example"
  cluster_arn  = "${data.aws_ecs_cluster.example.arn}"
}
