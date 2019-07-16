resource "aws_iam_role" "demo-iam-role-lambda-awscli" {
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

resource "aws_iam_role_policy" "demo-iam-role-policy-lambda-awscli" {
  name = "terraform-demo-iam-role-inline-policy-lambda-awscli"
  role = "${aws_iam_role.demo-iam-role-lambda-awscli.id}"

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


################################################################################################