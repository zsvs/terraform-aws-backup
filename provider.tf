﻿terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
  required_version = "1.4.6"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
