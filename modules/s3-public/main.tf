
resource "aws_s3_bucket" "nouv-fic" {
  count         = length(var.buckets)
  bucket        = var.buckets[count.index]
  force_destroy = true
}

resource "aws_s3_bucket_policy" "public-policy" {
  count = length(data.aws_iam_policy_document.public-b-p)

  bucket = aws_s3_bucket.nouv-fic[count.index].id
  policy = data.aws_iam_policy_document.public-b-p[count.index].id
}

data "aws_iam_policy_document" "public-b-p" {
  count = length(aws_s3_bucket.nouv-fic)
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    effect = "Allow"

    resources = [
      "${aws_s3_bucket.nouv-fic[count.index].arn}",
      "${aws_s3_bucket.nouv-fic[count.index].arn}/*"
    ]
  }
}



