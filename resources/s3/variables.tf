variable "app_name" {
    type = string
    description = "(optional) describe your variable"
}

variable "env" {
    type = string
    description = "(optional) describe your variable"
}

variable "cidr_block" {
    type = string
    description = "(optional) describe your variable"
    default = "20.0.0.0/16"
}

variable "az_count" {
    type = string
    description = "Number of AZs to cover in a given AWS region"
    default     = "3"
}

variable "availability_zones" {
    description = "Region availability zones"
    type = list
    default = [
        "ap-southeast-1a",
        "ap-southeast-1b",
        "ap-southeast-1c",
    ]   
}