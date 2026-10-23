variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "region" {
  type = string
}

variable "owner" {
  type = string
}

variable "docker_image" {
  type    = string
  default = ""
}
