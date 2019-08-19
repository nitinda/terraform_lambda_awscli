resource "null_resource" "demo_null_resource_cleanup" {
  provisioner "local-exec" {
    command = "rm -rf ${path.module}/lambda_function/awscli_layers_payload/*"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "demo_null_resource_download_pip_awscli" {
  provisioner "local-exec" {
    command = "pip install --upgrade awscli aws-list-all aws-sam-cli serverlessrepo==0.1.8 PyYAML~=3.12 -t ${path.module}/lambda_function/awscli_layers_payload/python"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = ["null_resource.demo_null_resource_cleanup"]
}

resource "null_resource" "demo_null_resource_create_symlink_awscli" {
  provisioner "local-exec" {
    command = "cd ${path.module}/lambda_function/awscli_layers_payload && ln -s bin/aws"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = ["null_resource.demo_null_resource_download_pip_awscli"]
}

resource "null_resource" "demo_null_resource_create_symlink_aws_list_all" {
  provisioner "local-exec" {
    command = "cd ${path.module}/lambda_function/awscli_layers_payload && ln -s bin/aws-list-all"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = ["null_resource.demo_null_resource_download_pip_awscli"]
}

resource "null_resource" "demo_null_resource_correct_python_location_awscli" {
  provisioner "local-exec" {
    command = "sed -i '1s/.*/\\#\\!\\/var\\/lang\\/bin\\/python/' ${path.module}/lambda_function/awscli_layers_payload/bin/aws"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = ["null_resource.demo_null_resource_create_symlink_awscli"]
}

resource "null_resource" "demo_null_resource_correct_python_location_aws_list_all" {
  provisioner "local-exec" {
    command = "sed -i '1s/.*/\\#\\!\\/var\\/lang\\/bin\\/python/' ${path.module}/lambda_function/awscli_layers_payload/bin/aws-list-all"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = ["null_resource.demo_null_resource_create_symlink_aws_list_all"]
}

resource "null_resource" "demo_null_resource_lambda_layers_payload_zip" {
  provisioner "local-exec" {
    command = "cd ${path.module}/lambda_function/awscli_layers_payload && zip -rqX ${path.module}/lambda_function/archive/terraform-demo-awscli-lambda-layer-payload.zip *"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = ["null_resource.demo_null_resource_create_symlink_awscli","null_resource.demo_null_resource_correct_python_location_aws_list_all"]
}
