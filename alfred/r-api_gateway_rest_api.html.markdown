resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "MyDemoAPI"
  description = "This is my API for demonstration purposes"
}

resource "aws_api_gateway_rest_api" "example" {
  name = "regional-example"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
