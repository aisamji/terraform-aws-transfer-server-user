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

  tags = "${var.tags}"
}

# AWS Transfer Server User

resource "aws_transfer_user" "default" {
  server_id = "${var.server_id}"
  user_name = "${var.user_name}"
  role      = "${aws_iam_role.default.arn}"

  tags = "${var.tags}"
}

# SSH Keys

resource "aws_transfer_ssh_key" "primary" {
  server_id = "${var.server_id}"
  user_name = "${var.user_name}"
  body      = "${var.ssh_keys[0]}"
}

resource "aws_transfer_ssh_key" "additional" {
  count = "${length(var.ssh_keys) - 1}"

  server_id = "${var.server_id}"
  user_name = "${var.user_name}"
  body      = "${element(var.ssh_keys, count.index + 1)}"
}
