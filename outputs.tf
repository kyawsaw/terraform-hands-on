output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "aws_security_group_id" {
  value = module.ec2.aws_security_group_id
}

