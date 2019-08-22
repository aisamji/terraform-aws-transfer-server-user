# IAM Role

data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type       = "Service"
      identifier = "transfer.amazonaws.com"
    }
  }
}

resource "aws_iam_role" "default" {
  name               = "${var.user_name}"
  assume_role_policy = "${data.aws_iam_policy_document.default.json}"
  tags               = "${var.tags}"
}
