variable "env" {
  description = "Testing Environment"
  default     = "replay"
}

variable "app_name" {
  description = "Name of the app"
}

variable "region" {
  description = "Default region"
}

variable "availability_zones" {
  description = "Availability Zones"
}

variable "az_count" {
  description = "No Of Availability Zones"
}

variable "cidr_block" {
  description = "CIDR Black Information"
}
