  backend "s3" {
    bucket       = "vijay-backstage-tfstate-v2"
    region       = "us-east-1"
    use_lockfile = true
  }
