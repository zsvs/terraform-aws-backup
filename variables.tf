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

variable "kms_key_arn" {
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

variable "plan_enabled" {
  type        = bool
  description = "Defines whether or not to create backup plan resources"
  default     = true
}

variable "backup_vault_tags" {
  type        = map(string)
  description = "Backup vault tags"
  default     = { "terraform" : "true" }
}

variable "rules" {
  type        = list(any)
  description = "An array of rule maps used to define schedules in a backup plan"
  default     = []
}

variable "recovery_point_tags" {
  type        = map(string)
  description = "Defines recovery points tags"
  default     = { "terraform" : "true" }
}

variable "cross_account_backup_enabled" {
  type        = bool
  description = "Enable cross account AWS backup"
  default     = true
}

variable "aws_backup_resources_names" {
  type        = string
  description = "Define name prefix of aws_backup_vault and aws_backup_plan"
  default     = "MyBackup"
}

variable "aws_backup_selection_resource_name" {
  type        = string
  description = "Define the name of aws resources that displayed in plan"
  default     = "MyResources"
}
