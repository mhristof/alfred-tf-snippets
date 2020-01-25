variable "lb_tg_arn" {
  type    = "string"
  default = ""
}

variable "lb_tg_name" {
  type    = "string"
  default = ""
}

data "aws_lb_target_group" "test" {
  arn  = "${var.lb_tg_arn}"
  name = "${var.lb_tg_name}"
}
