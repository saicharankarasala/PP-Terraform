module "alb_security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.3.0"
  name        = "alb-sg"
  description = "security group created for alb which will allow port and 80 from everywhere"
  vpc_id      = module.vpc-PP.vpc_id

  # Ingress rules
  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags                = local.common_tags

  # egress rules
  egress_rules = ["all-all"]

}