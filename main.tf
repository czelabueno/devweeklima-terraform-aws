provider "aws" {
  region     = "us-east-2"
  access_key = "xxxxxxxxx"
  secret_key = "${var.secret_key}"
}

module "s3_bucket" {
  source = "./s3-webstatic"
}

module "lambda_function" {
  source = "./lambda-function"
  app_version = "${var.app_version}"
}
