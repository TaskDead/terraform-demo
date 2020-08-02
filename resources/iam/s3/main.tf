data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "*",
    ]
    resources = [var.s3_bucket]
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "${var.env}-s3-policy"
  description = "Allow ec2 to access s3"
  policy      = data.aws_iam_policy_document.s3_policy_document.json
}

resource "aws_iam_role" "s3_access_role" {
  name               = "${var.env}-s3-access-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
}

resource "aws_iam_role_policy_attachment" "s3-attach" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}