resource "aws_iam_role" "demo_iam_role_lambda_awscli" {
  name = "terraform-demo-iam-role-lambda-awscli"

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

resource "aws_iam_role_policy" "demo_iam_role_policy_lambda_awscli" {
  name = "terraform-demo-iam-role-inline-policy-lambda-awscli"
  role = "${aws_iam_role.demo_iam_role_lambda_awscli.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "ec2:Describe*",
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogGroup",
          "logs:PutRetentionPolicy",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents"
        ],
        "Resource": [
          "*"
        ]
      }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "demo_iam_role_policy_attachment_lambda_awscli_role_ReadOnlyAccess" {
  role       = "${aws_iam_role.demo_iam_role_lambda_awscli.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

################################################################################################