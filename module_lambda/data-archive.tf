data "archive_file" "demo_archive_file_lambda_function_archive_awscli" {
  type        = "zip"
  source_file = "${path.module}/lambda_function/terraform-demo-lambda-awscli/lambda_function.py"
  output_path = "${path.module}/lambda_function/archive/terraform-lambda-function-archive-awscli.zip"
}

