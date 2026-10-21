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

module "ec2_instance" {
  source      = "git::https://github.com/Vijay-godson/terraform-aws-ec2-instance.git"
  instance_name = var.instance_name
  owner       = var.owner
  instance_type = var.instance_type
  region = var.region
}
