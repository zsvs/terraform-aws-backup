<!-- BEGIN_TF_DOCS -->
# Terraform module for AWS Backup service

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_backup_global_settings.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/resources/backup_global_settings) | resource |
| [aws_backup_plan.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/resources/backup_plan) | resource |
| [aws_backup_selection.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/resources/backup_selection) | resource |
| [aws_backup_vault.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/resources/backup_vault) | resource |
| [aws_backup_vault_policy.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/resources/backup_vault_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_backup_iam_role_arn"></a> [aws\_backup\_iam\_role\_arn](#input\_aws\_backup\_iam\_role\_arn) | IAM role ARN for AWS backup | `string` | n/a | yes |
| <a name="input_aws_backup_plan_rule_name"></a> [aws\_backup\_plan\_rule\_name](#input\_aws\_backup\_plan\_rule\_name) | Name of AWS backup resource | `string` | `"MyBackupPlanRuleName"` | no |
| <a name="input_aws_backup_selection_resources"></a> [aws\_backup\_selection\_resources](#input\_aws\_backup\_selection\_resources) | ARNs of aws resources that we want to backup | `list(string)` | `[]` | no |
| <a name="input_cross_account_backup_enabled"></a> [cross\_account\_backup\_enabled](#input\_cross\_account\_backup\_enabled) | Enable cross account AWS backup | `string` | `"true"` | no |
| <a name="input_kms_key_ARN"></a> [kms\_key\_ARN](#input\_kms\_key\_ARN) | KMS key ARN for aws backup vault | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | AWS profile | `string` | `""` | no |
| <a name="input_recovery_point_tags"></a> [recovery\_point\_tags](#input\_recovery\_point\_tags) | Name of AWS backup resource | <pre>object({<br>    key   = string,<br>    value = string<br>  })</pre> | <pre>{<br>  "key": "Name",<br>  "value": "TF_RECOVERY_POINT_TAG"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region param | `string` | `"eu-west-1"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | An array of rule maps used to define schedules in a backup plan | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_backup_plan_arn"></a> [aws\_backup\_plan\_arn](#output\_aws\_backup\_plan\_arn) | n/a |
| <a name="output_aws_backup_plan_id"></a> [aws\_backup\_plan\_id](#output\_aws\_backup\_plan\_id) | n/a |
| <a name="output_aws_backup_plan_tags_all"></a> [aws\_backup\_plan\_tags\_all](#output\_aws\_backup\_plan\_tags\_all) | n/a |
| <a name="output_aws_backup_plan_version"></a> [aws\_backup\_plan\_version](#output\_aws\_backup\_plan\_version) | n/a |
| <a name="output_aws_backup_vault_arn"></a> [aws\_backup\_vault\_arn](#output\_aws\_backup\_vault\_arn) | n/a |
| <a name="output_aws_backup_vault_id"></a> [aws\_backup\_vault\_id](#output\_aws\_backup\_vault\_id) | n/a |
| <a name="output_aws_backup_vault_recovery_points"></a> [aws\_backup\_vault\_recovery\_points](#output\_aws\_backup\_vault\_recovery\_points) | n/a |
| <a name="output_aws_backup_vault_tags_all"></a> [aws\_backup\_vault\_tags\_all](#output\_aws\_backup\_vault\_tags\_all) | n/a |
<!-- END_TF_DOCS -->