module "ec2_instance" {
  source      = "git::https://github.com/Vijay-godson/terraform-aws-ec2-instance.git"
  instance_name = var.instance_name
  owner       = var.owner
  instance_type = var.instance_type
  region = var.region
}
