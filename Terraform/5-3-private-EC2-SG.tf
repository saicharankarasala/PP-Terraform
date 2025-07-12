module "private_security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.3.0"
  name        = "private-sg"
  description = "security group created for private which will allow port 22 and 80 from vpc range only"
  vpc_id      = module.vpc-PP.vpc_id

  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc-PP.vpc_cidr_block]
  tags                = local.common_tags

  egress_rules = ["all-all"]
}