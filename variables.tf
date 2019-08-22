variable "server_id" {
  description = "The server ID of the Transfer Server (e.g. `s-12345678`)"
}

variable "user_name" {
  description = "The name used for log in to your SFTP server."
}

variable "bucket_name" {
  description = "The name of the S3 bucket that this user should have access to."
}

variable "home_prefix" {
  description = "The *root* S3 prefix for this user. The default is the same as the `user_name`."
  default     = ""
}

variable "ssh_keys" {
  description = "A list of the public keys that will be used by the server to authenticate the user. At least one must be provided."
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resources created by this module."
  default     = {}
}
