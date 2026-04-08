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
variable "vpcId" {
    description = "VPC ID "
    type = string
}
