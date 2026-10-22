output "private_key_pem" {
  value     = module.ec2_instance.private_key_pem
  sensitive = true
}

output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}
