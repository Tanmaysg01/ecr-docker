resource "aws_lambda_function" "pipeline-lambda-function" {
function_name = "pipeline-lambda-function"
description   = "lambda function from terraform"
image_uri     = "875716031392.dkr.ecr.us-east-1.amazonaws.com/ecr-repository:latest"
package_type  = "Image"
architectures = ["x86_64"]
role          = "arn:aws:iam::875716031392:role/service-role/lambda-role-2janxn9g"
}