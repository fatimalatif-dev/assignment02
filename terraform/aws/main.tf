locals {
    project = "assignment"
    env= terraform.workspace
}

module "vpc" {
    source = "./module/vpc"
    project = local.project
    env= local.env
}

module "securityGroup" {
    source = "./module/security_group"
    vpcId =  module.vpc.vpcId
    project = local.project
    env= local.env
}

module "webInstance" {
    source = "./module/ec2"
    ami= var.ec2AMIId
    instanceSG = [module.securityGroup.instanceSGId]
    subnetID = module.vpc.publicSubnetId
    instanceType = var.instanceType
    project = local.project
    env= local.env 
 
}