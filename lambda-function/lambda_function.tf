variable "app_version" {}

resource "aws_lambda_function" "lambda" {
  count = "${var.count}"
  function_name = "ServerlessDevweeklima"
  s3_bucket = "devlimabucketexample"
  s3_key = "v${var.app_version}/devweeklima-webapp-aws.zip"
  handler = "main.handler"
  runtime = "nodejs10.x"

  role = "${aws_iam_role.lambda_exec.arn}"
}

resource "aws_iam_role" "lambda_exec" {
   count = "${var.count}"
   name = "serverless_lambda_permissons" 
assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}