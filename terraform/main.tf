terraform {
  # storing statefile in S3
  backend "s3" {
    bucket = "terraform-285db723-5211-49ad-840b-ad14c9f72d2e"
    region = "us-west-2"
    key = "state"

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

locals {
  env = terraform.workspace
}

