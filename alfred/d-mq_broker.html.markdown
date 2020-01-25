variable "broker_id" {
  type    = "string"
  default = ""
}

variable "broker_name" {
  type    = "string"
  default = ""
}

data "aws_mq_broker" "by_id" {
  broker_id = "${var.broker_id}"
}

data "aws_mq_broker" "by_name" {
  broker_name = "${var.broker_name}"
}
