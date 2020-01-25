data "aws_api_gateway_rest_api" "selected" {
  name = "${var.api_gateway_name}"
}

data "aws_cognito_user_pools" "selected" {
  name = "${var.cognito_user_pool_name}"
}

resource "aws_api_gateway_authorizer" "cognito" {
  name          = "cognito"
  type          = "COGNITO_USER_POOLS"
  rest_api_id   = "${data.aws_api_gateway_rest_api.selected.id}"
  provider_arns = ["${data.aws_cognito_user_pools.selected.arns}"]
}
