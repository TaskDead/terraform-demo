variable "env" {}
variable "vpc_id" {}
variable "app_name" {}
variable "ami_id" {}
variable "host_key" {}
variable "public_subnet_ids" {
  type = list
}
variable "s3_role_name" {}
