env      = "replay"
app_name = "demo"

region = "us-east-1"

cidr_block = "10.20.0.0/16"

az_count = 2

availability_zones = [
  "us-east-1a",
  "us-east-1b",
]

host_key = "ec2-host"
ami_id   = "ami-02354e95b39ca8dec"