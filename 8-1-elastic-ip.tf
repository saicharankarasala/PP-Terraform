resource "aws_eip" "elastic_ip" {

  depends_on = [
    module.vpc-PP,
    module.bastion_instance
  ]
  instance = module.bastion_instance.id
  domain   = "vpc"

}