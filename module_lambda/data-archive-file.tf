data "archive_file" "demo_archive_file_lambda_function_archive_awscli" {
  type        = "zip"
  source_file = "${path.module}/lambda_function/terraform-demo-lambda-awscli/lambda_function.py"
  output_path = "${path.module}/lambda_function/archive/terraform-lambda-function-archive-awscli.zip"
}

# data "archive_file" "demo_lambda_layers_archive_awscli" {
#   type        = "zip"
#   source_dir  = "${path.module}/lambda_function/awscli_layers_payload/"
#   output_path = "${path.module}/lambda_function/archive/terraform-demo-awscli-lambda-layer-payload.zip"
#   depends_on  = ["null_resource.demo_null_resource_correct_python_location_awscli","null_resource.demo_null_resource_correct_python_location_aws_list_all"]
# }
