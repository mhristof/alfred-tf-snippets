data "aws_api_gateway_rest_api" "my_rest_api" {
  name = "my-rest-api"
}

data "aws_api_gateway_resource" "my_resource" {
  rest_api_id = "${data.aws_api_gateway_rest_api.my_rest_api.id}"
  path        = "/endpoint/path"
}
