data "aws_security_groups" "test" {
  tags = {
    Application = "k8s"
    Environment = "dev"
  }
}

data "aws_security_groups" "test" {
  filter {
    name   = "group-name"
    values = ["*nodes*"]
  }

  filter {
    name   = "vpc-id"
    values = ["${var.vpc_id}"]
  }
}
