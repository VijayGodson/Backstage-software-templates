terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "vijay-backstage-tfstate-v2"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "bucket" {
  source      = "git::https://github.com/Vijay-godson/terraform-aws-s3-bucket.git"
  bucket_name = var.bucket_name
  owner       = var.owner
  environment = var.environment
}
