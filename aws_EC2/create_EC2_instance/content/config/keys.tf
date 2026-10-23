resource "aws_s3_object" "private_key" {
  bucket  = "vijay-backstage-tfstate-v2"
  key     = "ec2-instances/${var.instance_name}/${var.instance_name}.pem"
  content = module.ec2_instance.private_key_pem

  server_side_encryption = "AES256"
}
