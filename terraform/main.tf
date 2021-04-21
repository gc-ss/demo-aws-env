terraform {
  # storing statefile in S3
  backend "s3" {
    bucket = "terraform-285db723-5211-49ad-840b-ad14c9f72d2e"
    region = "us-west-2"

    dynamodb_table = "terraform"
    encrypt        = true
  }
  required_providers {
    # used for random number, string, server name generation
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-285db723-5211-49ad-840b-ad14c9f72d2e"
  acl    = "private"

  tags = {
    Name    = "Terraform State"
    Managed = "Terraform"
  }
}

# Locking state for ensuring multiple developer state applications don't break state.
resource "aws_dynamodb_table" "terraform" {
  name         = "terraform"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Managed = "Terraform"
  }
}

locals {
  env = terraform.workspace
}

