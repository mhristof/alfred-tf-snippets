data "aws_directory_service_directory" "example" {
  directory_id = "${aws_directory_service_directory.main.id}"
}
