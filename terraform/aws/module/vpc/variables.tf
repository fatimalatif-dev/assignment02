variable "vpcCidr" {
  description = "Cidr range for the AWS VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "publicCidrRange" {
    description = "Cidr range for the public subnet"
    type = string
    default = "10.0.1.0/24"
}
variable "privateCidrRange" {
    description = "Cidr range for the private subnet"
    type = string
    default = "10.0.10.0/24"
}
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
variable "zone" {
    description = "Name of the availablity zone"
    type = list(string)
    default = [ "us-east-1a", "us-east-1b" ]
  
}
