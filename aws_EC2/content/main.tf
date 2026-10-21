terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "vijay-backstage-tfstate-v2"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "bucket" {
  source      = "git::https://github.com/Vijay-godson/terraform-aws-ec2-instance.git"
  instance_name = var.instance_name
  owner       = var.owner
  region = var.region
}
