output "instance_id" {
  value = aws_instance.bagisto.id
}

output "aws_security_group_id" {
  value = aws_security_group.instance_secgp.id
}