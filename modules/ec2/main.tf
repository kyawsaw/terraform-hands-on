data "aws_ami" "name" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "tag:Project"
    values = [var.project_name]
    # values = ["var.project_name"]           # this won't work, Terraform treats it as a literal string
    # values = ["${var.project_name}"]        # this will work too (Using String Interpolation)
  }

  filter {
    name   = "tag:ImageRole"
    values = ["bagisto"]
  }

  filter {
    name   = "tag:Provisioner"
    values = ["packer"]
  }
}

#####
resource "aws_security_group" "instance_secgp" {
  name        = "${var.project_name}-instance-secgp"
  description = "Allow http and https traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.project_name
    Environment = var.environment
  }
}

#####
resource "aws_instance" "bagisto" {
  ami                         = data.aws_ami.name.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_1_id
  vpc_security_group_ids      = [aws_security_group.instance_secgp.id]
  iam_instance_profile        = var.iam_instance_profile_name
  associate_public_ip_address = true
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }
  tags = {
    Name = var.project_name
  }
}