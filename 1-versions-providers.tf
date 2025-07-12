# Terraform Settings Block
terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
  }
}

# AWS Provider Block
provider "aws" {
  profile = "My-Portfolio"
  region  = "us-east-1"
}