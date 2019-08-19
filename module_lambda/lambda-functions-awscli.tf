resource "aws_lambda_function" "demo_lambda_awscli" {
    filename         = "${data.archive_file.demo_archive_file_lambda_function_archive_awscli.output_path}"
    function_name    = "terraform-demo-lambda-awscli"
    description      = "Terraform Demo lambda function with awscli"
    role             = "${aws_iam_role.demo_iam_role_lambda_awscli.arn}"
    handler          = "lambda_function.lambda_handler"
    source_code_hash = "${data.archive_file.demo_archive_file_lambda_function_archive_awscli.output_base64sha256}"
    runtime          = "python3.7"
    timeout          = "300"
    memory_size      = "128"
    layers           = ["${aws_lambda_layer_version.demo_lambda_layer_awscli.arn}"]
    publish          = true
}

resource "aws_lambda_layer_version" "demo_lambda_layer_awscli" {
    description         = "Terraform demo lambda layer for awscli"
    filename            = "${path.module}/lambda_function/archive/terraform-demo-awscli-lambda-layer-payload.zip"
    layer_name          = "terraform-demo-lambda-layer-payload-awscli"
    compatible_runtimes = ["python3.7"]
    source_code_hash    = "${filebase64sha256("${path.module}/lambda_function/archive/terraform-demo-awscli-lambda-layer-payload.zip")}"
}