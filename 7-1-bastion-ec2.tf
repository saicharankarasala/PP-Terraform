module "bastion_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "6.0.2"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.bastion_security_group.security_group_id]
  subnet_id              = module.vpc-PP.public_subnets[0]
  tags                   = merge(local.common_tags, {"Name" = "bastion-host"})
}