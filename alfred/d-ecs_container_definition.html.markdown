data "aws_ecs_container_definition" "ecs-mongo" {
  task_definition = "${aws_ecs_task_definition.mongo.id}"
  container_name  = "mongodb"
}
