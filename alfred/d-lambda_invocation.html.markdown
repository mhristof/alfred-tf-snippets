data "aws_lambda_invocation" "example" {
  function_name = "${aws_lambda_function.lambda_function_test.function_name}"

  input = <<JSON
{
  "key1": "value1",
  "key2": "value2"
}
JSON
}

output "result" {
  description = "String result of Lambda execution"
  value       = "${data.aws_lambda_invocation.example.result}"
}

# In Terraform 0.11 and earlier, the result_map attribute can be used
# to convert a result JSON string to a map of string keys to string values.
output "result_entry_tf011" {
  value = "${data.aws_lambda_invocation.example.result_map["key1"]}"
}

# In Terraform 0.12 and later, the jsondecode() function can be used
# to convert a result JSON string to native Terraform types.
output "result_entry_tf012" {
  value = jsondecode(data.aws_lambda_invocation.example.result)["key1"]
}
