module "private_instance" {
  for_each               = var.ec2_userdata_config
  depends_on             = [module.vpc-PP]
  name                   = each.value.name
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "6.0.2"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file(each.value.user_data)
  key_name               = var.key_name
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  subnet_id              = module.vpc-PP.private_subnets[0]
  tags                   = local.common_tags
}


variable "ec2_userdata_config" {
  type = map(object({
    name      = string
    user_data = string
  }))
  default = {
    "server-1" = {
      name      = "server-1"
      user_data = "app1.sh"
    }
    "server-2" = {
      name      = "server-2"
      user_data = "app2.sh"
    }
  }
}
