variable "bucket_name" { type = string }
variable "owner"       { type = string }
variable "environment" { type = string }
variable "log_bucket" {
  type    = string
  default = "vijay-platform-access-logs"
}
