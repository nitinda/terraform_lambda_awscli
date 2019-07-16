resource "aws_lambda_function" "demo-lambda-awscli" {
    filename         = "${path.module}/lambda_function/terraform-lambda-function-archive-awscli.zip"
    function_name    = "terraform-demo-lambda-awscli"
    description      = "Terraform Demo lambda function with awscli"
    role             = "${aws_iam_role.demo-iam-role-lambda-awscli.arn}"
    handler          = "lambda_function.lambda_handler"
    source_code_hash = "${filebase64sha256("${path.module}/lambda_function/terraform-lambda-function-archive-awscli.zip")}"
    runtime          = "python3.7"
    timeout          = "120"
    memory_size      = "128"
    layers           = ["${aws_lambda_layer_version.demo-lambda-layer-awscli.arn}"]
    depends_on       = ["data.archive_file.demo-lambda-function-archive-awscli"]
    publish          = true
}

resource "aws_lambda_layer_version" "demo-lambda-layer-awscli" {
    description = "Terraform demo lambda layer for awscli"
    filename   = "${path.module}/awscli_layers_payload/terraform-demo-awscli-lambda-layer-payload.zip"
    layer_name = "terraform-demo-lambda-layer-payload-awscli"
    compatible_runtimes = ["python3.7"]
    source_code_hash = "${base64sha256(file("${path.module}/awscli_layers_payload/terraform-demo-awscli-lambda-layer-payload.zip"))}"
}