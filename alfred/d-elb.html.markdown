variable "lb_name" {
  type    = "string"
  default = ""
}

data "aws_elb" "test" {
  name = "${var.lb_name}"
}
