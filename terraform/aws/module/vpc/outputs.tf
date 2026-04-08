output "vpcId" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc.id
}
output "publicSubnetId" {
  description = "Id of the public subnet"
  value = aws_subnet.publicSubnet.id
}
output "privateSubnetId" {
  description = "Id of the private subnet"
  value = aws_subnet.privateSubnet.id
}