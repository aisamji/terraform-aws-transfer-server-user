# IAM Role

data "aws_iam_policy_document" "transfer_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["transfer.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "default" {
  name               = "${var.user_name}"
  assume_role_policy = "${data.aws_iam_policy_document.transfer_role.json}"

  tags = "${var.tags}"
}

# AWS Transfer Server User

data "aws_iam_policy_document" "scope_down" {
  statement {
    sid       = "AllowListingOfUserFolder"
    actions   = ["s3:ListBucket"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::$${transfer:HomeBucket}"]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"

      values = [
        "$${transfer:HomeFolder}/*",
        "$${transfer:HomeFolder}"
      ]
    }
  }

  statement {
    sid    = "HomeDirObjectAccess"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObjectVersion",
      "s3:DeleteObject",
      "s3:GetObjectVersion",
      "s3:GetObjectACL",
      "s3:PutObjectACL"
    ]

    resources = ["arn:aws:s3:::$${transfer:HomeDirectory}*"]
  }
}

locals {
  home_directory = "/${var.bucket_name}/${length(var.home_prefix) == 0 ? var.user_name : var.home_prefix}"
}

resource "aws_transfer_user" "default" {
  server_id = "${var.server_id}"
  user_name = "${var.user_name}"
  role      = "${aws_iam_role.default.arn}"

  home_directory = "${local.home_directory}"
  policy         = "${data.aws_iam_policy_document.scope_down.json}"

  tags = "${var.tags}"
}

# SSH Keys

resource "aws_transfer_ssh_key" "primary" {
  server_id = "${var.server_id}"
  user_name = "${var.user_name}"
  body      = "${var.ssh_keys[0]}"

  depends_on = ["aws_transfer_user.default"]
}

resource "aws_transfer_ssh_key" "additional" {
  count = "${length(var.ssh_keys) - 1}"

  server_id = "${var.server_id}"
  user_name = "${var.user_name}"
  body      = "${element(var.ssh_keys, count.index + 1)}"

  depends_on = ["aws_transfer_user.default"]
}
