data "aws_cloudformation_export" "subnet_id" {
  name = "mySubnetIdExportName"
}

resource "aws_instance" "web" {
  ami           = "ami-abb07bcb"
  instance_type = "t1.micro"
  subnet_id     = "${data.aws_cloudformation_export.subnet_id.value}"
}
