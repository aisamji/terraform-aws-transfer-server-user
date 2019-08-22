# IAM role aspects that are used to attach policies to assign permissions.
output "role_arn" {
  description = "The ARN of the IAM Role. Used by some resources to attach policies."
  value       = "${aws_iam_role.default.arn}"
}

output "role_id" {
  description = "The ID of the IAM Role. Used by some resources to attach policies."
  value       = "${aws_iam_role.default.id}"
}

output "role_name" {
  description = "The name of the IAM Role. Used by some resources to attach policies."
  value       = "${aws_iam_role.default.name}"
}
