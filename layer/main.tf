terraform {
  required_version = ">= 0.11.7"
}

module "aws_resources_module_lambda" {
  source  = "../module_lambda"

  providers = {
    "aws"  = "aws.services"
  }
}