provider "aws" {
  region = "us-east-2"
}

module "user1" {
  source = "../../"

  server_id   = "${var.server_id}"
  user_name   = "${var.user1["user_name"]}"
  bucket_name = "${var.bucket_name}"
  home_prefix = "${var.group_home_dir}"
  ssh_keys    = "${var.user1["ssh_keys"]}"
}

# While this policy allows full access to all S3 buckets,
# the server_user has a scope-down policy that restricts its access to a
# specific prefix in a single bucket.
resource "aws_iam_role_policy_attachment" "user1_full_access" {
  role       = "${module.user1.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

module "user2" {
  source = "../../"

  server_id   = "${var.server_id}"
  user_name   = "${var.user2["user_name"]}"
  bucket_name = "${var.bucket_name}"
  home_prefix = "${var.group_home_dir}"
  ssh_keys    = "${var.user2["ssh_keys"]}"
}

# While this policy allows full access to all S3 buckets,
# the server_user has a scope-down policy that restricts its access to a
# specific prefix in a single bucket.
resource "aws_iam_role_policy_attachment" "user2_full_access" {
  role       = "${module.user2.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
