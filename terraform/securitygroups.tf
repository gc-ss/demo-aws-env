resource "aws_security_group" "external_access" {
  name        = "External Access"
  description = "Allow access from local network"
  vpc_id      = module.demo.vpc_id

  tags = var.tags_mgmt
}

resource "aws_security_group_rule" "local_ip" {
  type              = "ingress"
  description       = "Access from External Home IP"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["${var.local_ip}"]
  security_group_id = aws_security_group.external_access.id

}


resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  description       = "Allow Outbound"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.external_access.id

}