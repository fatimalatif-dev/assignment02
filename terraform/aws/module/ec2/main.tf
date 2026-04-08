resource "aws_instance" "webInstance" {
  ami           = var.ami
  instance_type = var.instanceType
  subnet_id     = var.subnetID
  security_groups = var.instanceSG 

  tags = {
    Name        = "webInstance-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}