# AWS Transfer Server User

A terraform module to manage a user for an [AWS Transfer Server](https://aws.amazon.com/sftp/); the server should be created via other means (i.e. another Terraform module or manually). You can create a user and manage the SSH keys that are used to authenticate the user to the server. SSH keys and users on the AWS Transfer Server are managed separately and it is possible to manually create an SSH key for a user created via Terraform that is invisible to Terraform.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
