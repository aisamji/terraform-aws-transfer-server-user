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
