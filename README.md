# AWS Transfer Server User

A terraform module to manage a user for an [AWS Transfer Server](https://aws.amazon.com/sftp/); the server should be created via other means (i.e. another Terraform module or manually). You can create a user and manage the SSH keys that are used to authenticate the user to the server. SSH keys and users on the AWS Transfer Server are managed separately and it is possible to manually create an SSH key for a user created via Terraform that is invisible to Terraform.

This module will create the following:
- A user for the Transfer Server.
- One or more SSH key associations that will be used to authenticate the user to the server.
- An IAM role that will be used to determine the permissions for the user. (*The `id`, `arn`, and `name` will be exported to allow customizing permissions. No permissions will be added by default.*)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_name | The name of the S3 bucket that this user should have access to. | string | n/a | yes |
| home\_prefix | The *root* S3 prefix for this user. The default is the same as the `user_name`. | string | `""` | no |
| server\_id | The server ID of the Transfer Server (e.g. `s-12345678`) | string | n/a | yes |
| ssh\_keys | A list of the public keys that will be used by the server to authenticate the user. At least one must be provided. | list | `[]` | no |
| tags | A mapping of tags to assign to the resources created by this module. | map | `{}` | no |
| user\_name | The name used for log in to your SFTP server. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | The ARN of the IAM Role. Used by some resources to attach policies. |
| role\_id | The ID of the IAM Role. Used by some resources to attach policies. |
| role\_name | The name of the IAM Role. Used by some resources to attach policies. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
