variable "mount_target_id" {
  type    = "string"
  default = ""
}

data "aws_efs_mount_target" "by_id" {
  mount_target_id = "${var.mount_target_id}"
}
