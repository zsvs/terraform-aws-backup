locals {

  single_rule = [{
    name                     = "default_daily_rule"
    schedule                 = "cron(0 8 * * ? *)"
    start_window             = 60
    completion_window        = 120
    enable_continuous_backup = true
    lifecycle = {
      delete_after = 7
    }
  }]
}

data "aws_organizations_organization" "this" {}

resource "aws_backup_vault" "this" {
  name        = "${var.aws_backup_resources_names}-Vault"
  kms_key_arn = var.kms_key_arn
  tags        = var.backup_vault_tags
}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "backup:CopyIntoBackupVault",
    ]

    condition {
      test     = "StringEquals"
      variable = "saws:PrincipalOrgID"
      values   = [data.aws_organizations_organization.this.id]
    }
    resources = [aws_backup_vault.this.arn]
  }
}

resource "aws_backup_vault_policy" "this" {
  backup_vault_name = aws_backup_vault.this.name
  policy            = data.aws_iam_policy_document.this.json
}

resource "aws_backup_global_settings" "this" {
  global_settings = {
    "isCrossAccountBackupEnabled" = var.cross_account_backup_enabled
  }
}

resource "aws_backup_plan" "this" {
  count = var.plan_enabled == true ? 1 : 0
  name  = "${var.aws_backup_resources_names}-Plan"

  dynamic "rule" {
    for_each = length(var.rules) > 0 ? var.rules : local.single_rule

    content {
      rule_name                = lookup(rule.value, "name", "tf_created_rule")
      target_vault_name        = aws_backup_vault.this.name
      schedule                 = lookup(rule.value, "schedule", null)
      start_window             = lookup(rule.value, "start_window", null)
      completion_window        = lookup(rule.value, "completion_window", null)
      recovery_point_tags      = var.recovery_point_tags
      enable_continuous_backup = lookup(rule.value, "enable_continuous_backup", null)

      dynamic "lifecycle" {
        for_each = lookup(rule.value, "lifecycle", null) != null ? [true] : []

        content {
          cold_storage_after = lookup(rule.value.lifecycle, "cold_storage_after", null)
          delete_after       = lookup(rule.value.lifecycle, "delete_after", null)
        }
      }

      dynamic "copy_action" {
        for_each = try(lookup(rule.value.copy_action, "destination_vault_arn", null), null) != null ? [true] : []

        content {
          destination_vault_arn = lookup(rule.value.copy_action, "destination_vault_arn", null)
        }
      }
    }
  }
  tags = { "terraform" : "true", "module_aws_backup" : "true" }
}

resource "aws_backup_selection" "this" {
  count        = var.plan_enabled == true ? 1 : 0
  iam_role_arn = var.aws_backup_iam_role_arn
  name         = var.aws_backup_selection_resource_name
  plan_id      = aws_backup_plan.this[count.index].id

  resources = var.aws_backup_selection_resources # select resources by arn
}
