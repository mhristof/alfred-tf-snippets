variable "file_system_id" {
  type    = "string"
  default = ""
}

data "aws_efs_file_system" "by_id" {
  file_system_id = "${var.file_system_id}"
}
