variable "project" {
    description = "Project name "
    type = string
    default = "aws"
}
variable "env" {
    description = "Environment name"
    type = string
    default = "dev"
}
variable "instanceSG" {
    description = "Security Group ID"
    type = list(string)
}
variable "subnetID" {
    description = "Subnet ID"
    type = string
  
}
variable "instanceType" {
    description = "Instance type of EC2"
    type = string
  
}
variable "ami" {
    description = "Ami value for the instance"
    type = string
  
}