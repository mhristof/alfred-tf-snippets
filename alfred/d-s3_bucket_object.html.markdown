data "aws_s3_bucket_object" "bootstrap_script" {
  bucket = "ourcorp-deploy-config"
  key    = "ec2-bootstrap-script.sh"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-2757f631"
  user_data     = "${data.aws_s3_bucket_object.bootstrap_script.body}"
}

data "aws_s3_bucket_object" "lambda" {
  bucket = "ourcorp-lambda-functions"
  key    = "hello-world.zip"
}

resource "aws_lambda_function" "test_lambda" {
  s3_bucket         = "${data.aws_s3_bucket_object.lambda.bucket}"
  s3_key            = "${data.aws_s3_bucket_object.lambda.key}"
  s3_object_version = "${data.aws_s3_bucket_object.lambda.version_id}"
  function_name     = "lambda_function_name"
  role              = "${aws_iam_role.iam_for_lambda.arn}"             # (not shown)
  handler           = "exports.test"
}
