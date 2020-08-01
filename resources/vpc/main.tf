locals {
  private_subnet_list = ["${var.app_name}-private-1a", "${var.app_name}-private-1b", "${var.app_name}-private-1c"]
}

locals {
  public_subnet_list = ["${var.app_name}-public-1a", "${var.app_name}-public-1b", "${var.app_name}-public-1c"]
}


resource "aws_vpc" "vpc" {
    cidr_block           = var.cidr_block
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Name        = "${title(var.app_name)} ${title(var.env)} VPC"
        Environment = var.env
    }
}

resource "aws_subnet" "private" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = element(local.private_subnet_list, count.index)
    Environment = var.env
  }
}

resource "aws_subnet" "public" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, var.az_count + count.index)
  availability_zone = var.availability_zones[count.index]

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = element(local.public_subnet_list, count.index)
    Environment = var.env
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  # Rule for all the traffic in to be allowed in the specified cidr_block
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  # Rule for all the traffic out to be allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags  = {
    Name        = "${title(var.app_name)} ${title(var.env)} VPC Access Security Group"
    Environment = var.env
  }
}