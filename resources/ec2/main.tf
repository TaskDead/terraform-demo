resource "aws_security_group" "ssh_only" {
  name        = "ssh_only"
  description = "Only allow ssh incoming, but outgoing all"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "sample_profile" {
  name = "${var.env}-sample_profile"
  role = var.s3_role_name
}

resource "aws_instance" "sample" {
  count = 1

  ami                         = var.ami_id
  instance_type               = "t3.nano"
  key_name                    = var.host_key
  subnet_id                   = var.public_subnet_ids[count.index]
  vpc_security_group_ids      = [aws_security_group.ssh_only.id]
  iam_instance_profile        = aws_iam_instance_profile.sample_profile.name
  associate_public_ip_address = true

  tags = {
    Name        = "${title(var.app_name)} ${title(var.env)} S3 Host"
    Environment = var.env
  }
}

