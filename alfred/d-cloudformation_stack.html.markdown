data "aws_cloudformation_stack" "network" {
  name = "my-network-stack"
}

resource "aws_instance" "web" {
  ami           = "ami-abb07bcb"
  instance_type = "t1.micro"
  subnet_id     = "${data.aws_cloudformation_stack.network.outputs["SubnetId"]}"

  tags = {
    Name = "HelloWorld"
  }
}
