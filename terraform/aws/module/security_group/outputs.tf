output "instanceSGId" {
  description = "ID of the VPC"
  value       = aws_security_group.instanceSG.id
}

output "instanceSGName" {
  description = "Arn of the VPC"
  value       = aws_security_group.instanceSG.name
}
