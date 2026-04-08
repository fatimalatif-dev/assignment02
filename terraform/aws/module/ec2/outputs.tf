output "instanceID" {
  description = "Id of the ec2 instance"
  value = aws_instance.webInstance.id
}
output "instanceARN" {
  description = "ARN of the ec2 instance"
  value = aws_instance.webInstance.arn
}