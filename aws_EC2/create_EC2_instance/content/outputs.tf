output "private_key_pem" {
  value     = module.ec2_instance.private_key_pem
  sensitive = true
}
