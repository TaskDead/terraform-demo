terraform {
  backend "s3" {}
}
provider "aws" {
  region      = var.region
}

module "s3" {
  source      = "../resources/s3"
  app_name    = var.app_name
  env         = var.env
}

module "vpc" {
  source = "../resources/vpc"
  app_name = var.app_name
  env = var.env
  availability_zones = var.availability_zones
  az_count = var.az_count
  cidr_block = var.cidr_block
}
