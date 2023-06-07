variable "region" {
  type        = string
  description = "AWS region param"
  default     = "eu-west-1"
}

variable "profile" {
  type        = string
  description = "AWS profile"
  default     = ""
}

variable "kms_key_ARN" {
  type        = string
  description = "KMS key ARN for aws backup vault"
}

variable "aws_backup_iam_role_arn" {
  type        = string
  description = "IAM role ARN for AWS backup"
}

variable "aws_backup_selection_resources" {
  type        = list(string)
  description = "ARNs of aws resources that we want to backup"
  default     = []
}

variable "aws_backup_plan_rule_name" {
  type        = string
  description = "Name of AWS backup resource"
  default     = "MyBackupPlanRuleName"
}

# variable "backup_vault_tags" {
#   type        = object()
#   description = "Name of AWS backup resource"
#   default     = {"terraform"}
# }

variable "rules" {
  type        = list(any)
  description = "An array of rule maps used to define schedules in a backup plan"
  default     = []
}

variable "recovery_point_tags" {
  type = object({
    key   = string,
    value = string
  })

  description = "Name of AWS backup resource"
  default = {
    key : "Name",
    value : "TF_RECOVERY_POINT_TAG"
  }
}

variable "cross_account_backup_enabled" {
  type        = string
  description = "Enable cross account AWS backup"
  default     = "true"
}
