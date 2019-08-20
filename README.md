# Terraform Code For Lambda with awscli

Deploy a lambda function with Terraform


## What resources are created

1. Lambda Function
2. IAM Role and Policy for Lambda
3. Lambda Layer

----

## Prerequisite
Please make sure following software installed in local system.
- pip
- python 3.7
- zip
- terraform

```bash
# Download repo
git clone git@github.com:nitinda/terraform_lambda_awscli.git
cd terraform_lambda_awscli/module_lambda/awscli_layers_payload
mkdir python

# Download the required site packages for python
pip install awscli -t ./python
cd python
ln -s bin/aws
ln -s bin/aws-list-all

# Setup the python location
sed -i "1s/.*/\#\!\/var\/lang\/bin\/python/" bin/aws bin/aws-list-all

# Create layer payload archive
zip -r ../../lambda_function/terraform-demo-awscli-lambda-layer-payload.zip python/

```

----

## How to use this example

```bash
# Download Repo
cd terraform_lambda_awscli/layer
terraform init
terraform plan
terrafomr apply --auto-approve

```


## Manual Steps post deployment

```

- Test the deployed lambda with any test event.

```


----


## Cleaning up

You can destroy this cluster entirely by running:

```bash
terraform plan -destroy
terraform destroy --force --auto-approve
```