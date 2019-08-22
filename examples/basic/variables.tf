variable "server_id" {
  description = "The server ID of the Transfer Server (e.g. `s-12345678`)"
}

variable "user_name" {
  description = "The name used for log in to your SFTP server."
}

variable "bucket_name" {
  description = "The name of the S3 bucket that this user should have access to."
}

variable "ssh_keys" {
  description = "A list of the public keys that will be used by the server to authenticate the user. At least one must be provided."
  default     = []
}
