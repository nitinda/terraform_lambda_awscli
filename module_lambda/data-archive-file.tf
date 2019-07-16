data "archive_file" "demo-lambda-function-archive-awscli" {
  type        = "zip"
  source_file = "${path.module}/lambda_function/lambda_function.py"
  output_path = "${path.module}/lambda_function/terraform-lambda-function-archive-awscli.zip"
}

