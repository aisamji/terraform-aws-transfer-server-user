provider "aws" {
  region = "us-east-2"
}

module "server_user" {
  source = "../../"

  server_id   = "${var.server_id}"
  user_name   = "${var.user_name}"
  bucket_name = "${var.bucket_name}"
  ssh_keys    = "${var.ssh_keys}"
}

# While this policy allows full access to all S3 buckets,
# the server_user has a scope-down policy that restricts its access to a
# specific prefix in a single bucket.
resource "aws_iam_role_policy_attachment" "full_access" {
  role       = "${module.server_user.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
