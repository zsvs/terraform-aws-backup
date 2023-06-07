terraform {
  backend "s3" {
    bucket = "module-aws-backup"            # Bucket where to SAVE Terraform State
    key    = "aws-backup/terraform.tfstate" # Object name in the bucket to SAVE Terraform State
    region = "eu-west-1"                    # Region where bucket created
  }
}
