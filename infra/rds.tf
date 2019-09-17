# Source DB Security Group
resource "aws_security_group" "source_db" {
  name        = "source_db"
  description = "Manages security rules for the source db."
  vpc_id      = module.vpc.vpc_id
}

## Allows the DMS security group into this group
resource "aws_security_group_rule" "source_db_allow_dms" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.dms_db.id

  security_group_id = aws_security_group.source_db.id
}

## Allows outgoing traffic to the internet / rest of VPC
resource "aws_security_group_rule" "source_db_allow_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.source_db.id
}

# DMS Security Group
resource "aws_security_group" "dms_db" {
  name        = "dms_db"
  description = "Manages security rules for the DMS db."
  vpc_id      = module.vpc.vpc_id
}

## Allows outgoing traffic to the internet / rest of VPC
resource "aws_security_group_rule" "dms_db_allow_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.dms_db.id
}

# Destination Security Group
resource "aws_security_group" "destination_db" {
  provider    = "aws.new"
  name        = "destination_db"
  description = "Manages security rules for the destination db."
  vpc_id      = module.vpc_new.vpc_id
}

## Allows outgoing traffic to the internet / rest of VPC
resource "aws_security_group_rule" "destination_db_allow_egress" {
  provider    = "aws.new"
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.destination_db.id
}