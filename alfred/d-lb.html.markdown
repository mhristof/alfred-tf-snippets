variable "lb_arn" {
  type    = "string"
  default = ""
}

variable "lb_name" {
  type    = "string"
  default = ""
}

data "aws_lb" "test" {
  arn  = "${var.lb_arn}"
  name = "${var.lb_name}"
}
