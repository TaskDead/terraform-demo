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
