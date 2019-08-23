provider "aws" {
  region = "us-east-2"
}

module "admin" {
  source = "../../"

  server_id   = "${var.server_id}"
  user_name   = "${var.admin["user_name"]}"
  bucket_name = "${var.bucket_name}"
  home_prefix = "${var.admin_home_dir}"
  ssh_keys    = "${var.admin["ssh_keys"]}"
}

# While this policy allows full access to all S3 buckets,
# the server_user has a scope-down policy that restricts its access to a
# specific prefix in a single bucket.
resource "aws_iam_role_policy_attachment" "admin_full_access" {
  role       = "${module.admin.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

module "logger" {
  source = "../../"

  server_id   = "${var.server_id}"
  user_name   = "${var.logger["user_name"]}"
  bucket_name = "${var.bucket_name}"
  home_prefix = "${var.logger_home_dir}"
  ssh_keys    = "${var.logger["ssh_keys"]}"
}

# While this policy allows access to all S3 buckets,
# the server_user has a scope-down policy that restricts its access to a
# specific prefix in a single bucket.
data "aws_iam_policy_document" "write_only_access" {
  statement {
    effect = "Allow"
    actions = [
      "s3:List*",
      "s3:Put*",
      "s3:Create*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "write_only" {
  role   = "${module.logger.role_id}"
  name   = "AmazonS3WriteOnly"
  policy = "${data.aws_iam_policy_document.write_only_access.json}"
}
