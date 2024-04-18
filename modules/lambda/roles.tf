data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "s3-lambda-fa" {
  name               = "lambda-policy"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}



resource "aws_iam_role_policy_attachment" "test-attach" {
  count      = length(var.policy_arn)
  role       = aws_iam_role.s3-lambda-fa.name
  policy_arn = var.policy_arn[count.index]
}
