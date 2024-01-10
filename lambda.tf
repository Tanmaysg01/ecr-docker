resource "aws_lambda_function" "pipeline-lambda-function" {
function_name = "pipeline-lambda-function"
description   = "lambda function from terraform"
image_uri     = "875716031392.dkr.ecr.us-east-1.amazonaws.com/ecr-repository:latest"
package_type  = "Image"
architectures = ["x86_64"]
role          = "arn:aws:iam::875716031392:role/service-role/lambda-role-2janxn9g"
}

#resourceblock
resource "aws_iam_role" "lambda_role" {
  name = "lambda_docker_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_docker_policy"
  description = "Policy for Lambda Execution"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_policy.arn
  role       = aws_iam_role.lambda_role.name
}