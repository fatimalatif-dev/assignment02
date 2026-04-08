resource "aws_security_group" "instanceSG" {
  name        = "instanceSG-${var.project}-${var.env}"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = var.vpcId

  tags = {
    Name        = "instanceSG-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "allowSshPort" {
  security_group_id = aws_security_group.instanceSG.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allowAllTraffic" {
  security_group_id = aws_security_group.instanceSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}