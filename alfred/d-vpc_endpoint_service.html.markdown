# Declare the data source
data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

# Create a VPC
resource "aws_vpc" "foo" {
  cidr_block = "10.0.0.0/16"
}

# Create a VPC endpoint
resource "aws_vpc_endpoint" "ep" {
  vpc_id       = "${aws_vpc.foo.id}"
  service_name = "${data.aws_vpc_endpoint_service.s3.service_name}"
}

data "aws_vpc_endpoint_service" "custome" {
  service_name = "com.amazonaws.vpce.us-west-2.vpce-svc-0e87519c997c63cd8"
}
