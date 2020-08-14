terraform {
  backend "s3" {}
}
provider "aws" {
  region = var.region
}

module "s3" {
  source   = "../resources/s3"
  app_name = var.app_name
  env      = var.env
}

module "vpc" {
  source             = "../resources/vpc"
  app_name           = var.app_name
  env                = var.env
  availability_zones = var.availability_zones
  az_count           = var.az_count
  cidr_block         = var.cidr_block
}

module "iam_s3" {
  source    = "../resources/iam/s3"
  env       = var.env
  s3_bucket = module.s3.bucket_arn
}

module "ec2" {
  source            = "../resources/ec2"
  ami_id            = var.ami_id
  app_name          = var.app_name
  env               = var.env
  host_key          = var.host_key
  public_subnet_ids = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  s3_role_name      = module.iam_s3.s3_access_role_name
}
