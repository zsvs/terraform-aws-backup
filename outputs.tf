output "aws_backup_vault_id" {
  value = aws_backup_vault.this.id
}

output "aws_backup_vault_arn" {
  value = aws_backup_vault.this.arn
}

output "aws_backup_vault_recovery_points" {
  value = aws_backup_vault.this.recovery_points
}

output "aws_backup_vault_tags_all" {
  value = aws_backup_vault.this.tags_all
}

output "aws_backup_plan_id" {
  value = one(aws_backup_plan.this[*].id)
}

output "aws_backup_plan_arn" {
  value = one(aws_backup_plan.this[*].arn)
}

output "aws_backup_plan_tags_all" {
  value = one(aws_backup_plan.this[*].tags_all)
}

output "aws_backup_plan_version" {
  value = one(aws_backup_plan.this[*].version)
}
