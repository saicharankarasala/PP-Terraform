module "bastion_security_group" {
  source     = "terraform-aws-modules/security-group/aws"
  version    = "5.3.0"
  name       = "bastion-SG"
  description = "Security group for bastion with SSH and HTTP access"
  vpc_id     = module.vpc-PP.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = "0.0.0.0/0"   # ✅ as a string
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP access"
      cidr_blocks = "0.0.0.0/0"   # ✅ as a string
    }
  ]

  egress_rules = ["all-all"]
  tags         = local.common_tags
}