resource "aws_lambda_function" "test_lambda" {
  filename      = "code.zip"
  function_name = "img-processing"
  role          = aws_iam_role.s3-lambda-fa.arn
  handler       = "index.js"
  runtime       = "nodejs18.x"
  environment {
    variables = {
      foo = "bar"
    }
  }
}
